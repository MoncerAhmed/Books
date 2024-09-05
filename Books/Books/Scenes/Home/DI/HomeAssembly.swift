//
//  HomeAssembly.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Swinject
import SwinjectAutoregistration

class HomeAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: - Home

        container.register(HomeRouterProtocol.self) { resolver in
            return HomeRouter(
                detailsStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }

        container.autoregister(HomePresenterProtocol.self, initializer: HomePresenter.init)
        container.autoregister(HomeInteractorProtocol.self, initializer: HomeInteractor.init)

        container.storyboardInitCompleted(HomeViewController.self) { resolver, vc in
            let presenter = resolver ~> (HomePresenterProtocol.self)
            let router = resolver ~> (HomeRouterProtocol.self)
            let interactor = resolver ~> (HomeInteractorProtocol.self)
            let imageLoader = resolver ~> (ImageLoaderProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(imageLoader: imageLoader)
        }

        // MARK: - Books  service
        container.register(BooksServiceProtocol.self) { resolver in
            return BooksService(client: MoyaClient<BooksTarget>(
                networkObserver: resolver ~> (NetworkObserverProtocol.self)))
        }

        // MARK: - Details

        container.register(BookDetailsRouterProtocol.self) { resolver in
            return BookDetailsRouter()
        }
        container.autoregister(BookDetailsPresenterProtocol.self, initializer: BookDetailsPresenter.init)
        container.autoregister(BookDetailsInteractorProtocol.self, initializer: BookDetailsInteractor.init)
        container.storyboardInitCompleted(BookDetailsViewController.self) { resolver, vc in
            let presenter = resolver ~> (BookDetailsPresenterProtocol.self)
            let router = resolver ~> (BookDetailsRouterProtocol.self)
            let interactor = resolver ~> (BookDetailsInteractorProtocol.self)
            let imageLoader = resolver ~> (ImageLoaderProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(imageLoader: imageLoader)
        }
    }
}
