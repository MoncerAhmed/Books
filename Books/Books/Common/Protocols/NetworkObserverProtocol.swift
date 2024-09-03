//
//  NetworkObserverProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation
import Network
import Combine

//sourcery: AutoMockable
protocol NetworkObserverProtocol {

    var isConnectedToInternet: Bool { get }
    var started: Bool { get }
    var statePublisher: AnyPublisher<Bool, Never> { get }

    func startMonitoringNetwork()
}

final class NetworkObserver: NetworkObserverProtocol {

    @Published private(set) var isConnectedToInternet: Bool = true
    var statePublisher: AnyPublisher<Bool, Never> {
        $isConnectedToInternet.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }

    private var monitor: NWPathMonitorProtocol = NWPathMonitor()
    private(set) var started: Bool = false

    func startMonitoringNetwork() {
        if started { return }
        started = true
        monitor.start(queue: DispatchQueue.global(qos: .background))
        monitor.pathUpdateHandler = { [weak self] path in
            if self?.isConnectedToInternet != (path.status == .satisfied) {
                self?.isConnectedToInternet = path.status == .satisfied
            }
        }
    }
}
