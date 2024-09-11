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
    func presentEmptyFavorites()
}

class FavoritesPresenter: FavoritesPresenterProtocol {

    // MARK: Properties

    weak var viewController: FavoritesViewControllerProtocol?

    // MARK: DI

    func set(viewController: FavoritesViewControllerProtocol) {
        self.viewController = viewController
    }

    func present(favorites: [BookModel]) {
        let result = removeDuplicates(from: favorites)
        viewController?.display(favorites: result)
    }

    func presentEmptyFavorites() {
        viewController?.displayEmptyFavorites()
    }

    private func removeDuplicates(from books: [BookModel]) -> [BookModel] {
        var seenIds = Set<String>() // To keep track of unique IDs
        let uniqueBooks = books.filter { book in
            // Check if the book's id has been seen before
            if seenIds.contains(book.id) {
                return false // Duplicate, exclude this item
            } else {
                seenIds.insert(book.id) // Add the id to the set
                return true // Keep this item
            }
        }
        return uniqueBooks
    }
}
