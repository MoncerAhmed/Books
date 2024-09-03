//
//  NWPathMonitorProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Network

//sourcery: AutoMockable
protocol NWPathMonitorProtocol {

    var pathUpdateHandler: ((NWPath) -> Void)? { get set }

    func start(queue: DispatchQueue)
}

extension NWPathMonitor: NWPathMonitorProtocol {}
