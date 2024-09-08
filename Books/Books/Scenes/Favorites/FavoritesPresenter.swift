//
//  FavoritesPresenter.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol FavoritesPresenterProtocol {
    func set(viewController: FavoritesViewControllerProtocol)

    func present(favorites: [BookModel])
}

class FavoritesPresenter: FavoritesPresenterProtocol {

    // MARK: Properties

    weak var viewController: FavoritesViewControllerProtocol?

    // MARK: DI

    func set(viewController: FavoritesViewControllerProtocol) {
        self.viewController = viewController
    }

    func present(favorites: [BookModel]) {
        // TODO: change type to array of favorites
        viewController?.display(favorites: favorites)
    }
}
