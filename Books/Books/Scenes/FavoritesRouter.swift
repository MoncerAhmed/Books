//
//  FavoritesRouter.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol FavoritesRouterProtocol {
    func set(viewController: FavoritesViewControllerProtocol)
    func route(to scene: FavoritesRouter.Scene)
}

class FavoritesRouter: NSObject, FavoritesRouterProtocol {

    // MARK: Properties
    weak var viewController: FavoritesViewControllerProtocol?
    private let favoritesStoryboard: Storyboard

    // MARK: DI
    init(favoritesStoryboard: Storyboard) {
        self.favoritesStoryboard = favoritesStoryboard
    }

    func set(viewController: FavoritesViewControllerProtocol) {
        self.viewController = viewController
    }

    // MARK: Destinations

    enum Scene {
        case bookDetails
    }

    // MARK: Routing

    func route(to scene: FavoritesRouter.Scene) {
        switch scene {
        case .bookDetails:
            // TODO: handle routing to book details after implementation
            break
        }
    }
}
