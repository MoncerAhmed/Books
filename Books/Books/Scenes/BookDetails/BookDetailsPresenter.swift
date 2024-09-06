//
//  BookDetailsPresenter.swift
//  Books
//
//  Created by Ahmed Moncer on 05/09/2024.
//

import UIKit

protocol BookDetailsPresenterProtocol {
    func set(viewController: BookDetailsViewControllerProtocol)
    func present(book: BookModel)
    func presentFavoriteButton(isFavorite: Bool)
}

class BookDetailsPresenter: BookDetailsPresenterProtocol {

    weak var viewController: BookDetailsViewControllerProtocol?

    // MARK: DI

    func set(viewController: BookDetailsViewControllerProtocol) {
        self.viewController = viewController
    }

    // MARK: Presentation

    func present(book: BookModel) {
        viewController?.displayDetails(with: book)
    }

    func presentFavoriteButton(isFavorite: Bool) {
        viewController?.displayFavoriteButton(with: isFavorite)
    }
}
