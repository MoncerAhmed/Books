//
//  Provider.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation
import Moya
import Combine

protocol ClientProtocol {
    associatedtype Target

    func request<C: Codable>(_ target: Target) -> AnyPublisher<C, Error>

    /// Performs a network call.
    ///
    /// - Parameter target: the endpoint to which make the call.
    /// - Returns: AnyPublisher<Void, Error>
    func request(_ target: Target) -> AnyPublisher<Void, Error>

}

class MoyaClient<Target: TargetType>: ClientProtocol {

    private var provider: MoyaProvider<Target>!
    private let networkObserver: NetworkObserverProtocol
    private var store = Set<AnyCancellable>()

    init(networkObserver: NetworkObserverProtocol) {
            self.networkObserver = networkObserver
            let requestSession =  MoyaProvider<Target>.defaultAlamofireSession()

            provider = MoyaProvider<Target>(
                session: requestSession,
                plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
            )

        }

    func request<C>(_ target: Target) -> AnyPublisher<C, Error> where C: Decodable, C: Encodable {
        return Future { [provider, networkObserver] promise in
            guard networkObserver.isConnectedToInternet else {
                promise(.failure(ProviderError.noInternetConnection))
                return
            }

            provider?.request(target) { response in
                switch response {
                case .success(let value):
                    promise((Result(catching: { try value.filterSuccessfulStatusCodes().map(C.self) })))
                case .failure(let err):
                    promise(.failure(err))
                }
            }
        }.eraseToAnyPublisher()
    }

    func request(_ target: Target) -> AnyPublisher<Void, Error> {
        return Future { [provider, networkObserver] promise in
            guard networkObserver.isConnectedToInternet else {
                promise(.failure(ProviderError.noInternetConnection))
                return
            }

            provider?.request(target) { response in
                switch response {
                case .success(let value):
                    promise(Result(catching: { try value.filterSuccessfulStatusCodes() }))
                case .failure(let err):
                    promise(.failure(err))
                }
            }
        }.eraseToAnyPublisher()
    }
}
