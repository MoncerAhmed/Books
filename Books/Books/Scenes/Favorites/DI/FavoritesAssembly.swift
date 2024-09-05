//
//  FavoritesAssembly.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import Swinject
import SwinjectAutoregistration

class FavoritesAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: - Favorites

        container.register(FavoritesRouterProtocol.self) {
            return FavoritesRouter(favoritesStoryboard: $0 ~> (Storyboard.self, name: R.storyboard.favorites.name))
        }

        container.autoregister(FavoritesInteractorProtocol.self, initializer: FavoritesInteractor.init)
        container.autoregister(FavoritesPresenterProtocol.self, initializer: FavoritesPresenter.init)
        container.storyboardInitCompleted(FavoritesViewController.self) { resolver, vc in
            let interactor = resolver ~> (FavoritesInteractorProtocol.self)
            let presenter = resolver ~> (FavoritesPresenterProtocol.self)
            let router = resolver ~> (FavoritesRouterProtocol.self)
            let imageLoader = resolver ~> (ImageLoaderProtocol.self)

            presenter.set(viewController: vc)
            router.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(imageLoader: imageLoader)
        }
    }
}

