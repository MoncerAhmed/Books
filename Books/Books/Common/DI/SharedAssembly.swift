//
//  SharedAssembly.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration
import Network

class SharedAssembly: Assembly {
    let sharedContainer = Container(defaultObjectScope: .container)

    //swiftlint:disable:next function_body_length
    func assemble(container: Container) {

        // MARK: - Root Navigator
        container.register(RootNavigatorProtocol.self) { resolver in
            let rootNavigator = RootNavigator(
                application: resolver ~> UIApplicationProtocol.self,
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name))
            return rootNavigator
        }

        // MARK: - NetworkObserverProtocol
        container.register(NetworkObserverProtocol.self) { _ in
            return NetworkObserver()
        }
        .inObjectScope(.container)

        // MARK: - UIApplication
        container.register(UIApplicationProtocol.self) { _ in UIApplication.shared }

        // MARK: - Alert presenter
        container.autoregister(AlertPresenterProtocol.self, initializer: AlertPresenter.init)

        // MARK: - Top View Controller Provider
        container.autoregister(TopViewControllerProviderProtocol.self, initializer: TopViewControllerProvider.init)

        // MARK: - Error handler
        container.autoregister(ErrorHandlerProtocol.self, initializer: ErrorHandler.init)

        // MARK: - Home
        container.register(Storyboard.self, name: R.storyboard.home.name) { _ in
            return HomeStoryboard(sharedContainer: container, assembly: HomeAssembly())
        }
    }
}
