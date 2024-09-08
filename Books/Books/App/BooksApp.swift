//
//  BooksApp.swift
//  Books
//
//  Created by Ahmed Moncer on 02/09/2024.
//

import Foundation
import Swinject
import SwinjectAutoregistration

//sourcery: AutoMockable
protocol BaseAppProtocol {
    func prepare()
}

class BooksApp: NSObject, BaseAppProtocol {
    private let rootNavigator: RootNavigatorProtocol
    private let application: UIApplicationProtocol
    private let networkObserver: NetworkObserverProtocol

    init(rootNavigator: RootNavigatorProtocol,
         application: UIApplicationProtocol,
         networkObserver: NetworkObserverProtocol) {
        self.rootNavigator = rootNavigator
        self.application = application
        self.networkObserver = networkObserver
    }

    convenience init(sharedAssembly: Assembly, sharedContainer: Container) {
        sharedAssembly.assemble(container: sharedContainer)
        self.init(
            rootNavigator: sharedContainer ~> RootNavigatorProtocol.self,
            application: sharedContainer ~> UIApplicationProtocol.self,
            networkObserver: sharedContainer ~> NetworkObserverProtocol.self)
    }
    convenience override init() {
        let sharedAssembly = SharedAssembly()
        self.init(
            sharedAssembly: sharedAssembly,
            sharedContainer: sharedAssembly.sharedContainer)
    }

    func prepare() {
        rootNavigator.setTabBarAsRoot()
        networkObserver.startMonitoringNetwork()
    }
}
