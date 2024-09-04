//
//  TabBarAssembly.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import Swinject
import SwinjectAutoregistration
import Moya

class TabBarAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: - TabBar DI
        container.autoregister(TabBarInteractorProtocol.self,
                               initializer: TabBarInteractor.init)
        container.autoregister(TabBarPresenterProtocol.self,
                               initializer: TabBarPresenter.init)

        container.storyboardInitCompleted(TabBarViewController.self) { (r, vc) in
            let presenter = r ~> (TabBarPresenterProtocol.self)
            let interactor =  r ~> (TabBarInteractorProtocol.self)

            presenter.set(viewController: vc)

            vc.set(interactor: interactor)
        }

        // MARK: - TabBar ViewModel Provider
        container.register(TabBarViewModelProviderProtocol.self) { resolver in
            return TabBarViewModelProvider(
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name),
                favoritesStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.favorites.name),
                settingsStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.settings.name)
            )
        }
    }
}
