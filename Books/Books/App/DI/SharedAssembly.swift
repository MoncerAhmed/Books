//
//  SharedAssembly.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import CoreData
import Moya
import Network
import Swinject
import SwinjectAutoregistration
import UIKit

class SharedAssembly: Assembly {
    let sharedContainer = Container(defaultObjectScope: .container)

    //swiftlint:disable:next function_body_length
    func assemble(container: Container) {

        // MARK: - Core Data Container
        container.register(NSPersistentContainerProtocl.self) { _ in
            lazy var container = NSPersistentContainer(name: "Offline")
            container.loadPersistentStores { _, error in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            }
            container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
            return container
        }.inObjectScope(.container)

        // MARK: - LocalDataBaseManagerProtocol

        container.register(LocalDataBaseManagerProtocol.self) {
            return LocalDataBaseManager.init(container: $0 ~> (NSPersistentContainerProtocl.self))
        }.inObjectScope(.container)

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

        // MARK: - Image Loader
        container.autoregister(ImageLoaderProtocol.self, initializer: ImageLoader.init)

        // MARK: - Root Navigator
        container.register(RootNavigatorProtocol.self) { resolver in
            let rootNavigator = RootNavigator(
                application: resolver ~> UIApplicationProtocol.self,
                tabBarStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.tabBar.name)
            )
            return rootNavigator
        }

        // MARK: - Home
        container.register(Storyboard.self, name: R.storyboard.home.name) { _ in
            return HomeStoryboard(sharedContainer: container, assembly: HomeAssembly())
        }

        // MARK: - Tab Bar
        container.register(Storyboard.self, name: R.storyboard.tabBar.name) { _ in
            return TabBarStoryboard(sharedContainer: container, assembly: TabBarAssembly())
        }

        // MARK: - Favorites
        container.register(Storyboard.self, name: R.storyboard.favorites.name) { _ in
            return FavoritesStoryboard(sharedContainer: container, assembly: FavoritesAssembly())
        }
    }
}
