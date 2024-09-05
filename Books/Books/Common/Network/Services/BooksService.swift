//
//  BooksService.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Combine
import Moya

//sourcery: AutoMockable
protocol BooksServiceProtocol {
    func getBooks() -> AnyPublisher< [BookResponse], ClientError>
}

struct BooksService: BooksServiceProtocol {
    let client: MoyaClient<BooksTarget>

    init(client: MoyaClient<BooksTarget>) {
        self.client = client
    }

    func getBooks() -> AnyPublisher<[BookResponse], ClientError> {
        client.request(.books)
            .mapError { error in
                let defaultError = ClientError.unknownError
                switch error {
                case MoyaError.statusCode(let response):
                    guard let errorMessage = try? response.mapString(atKeyPath: "error_description")
                    else { return defaultError }
                    return .literal(errorMessage: errorMessage)
                default:
                    return defaultError
                }
            }
            .eraseToAnyPublisher()
    }
}
