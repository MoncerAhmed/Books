//
//  FavoritesInteractor.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol FavoritesInteractorProtocol {
    func handleViewDidLoad()
    func handleFavoriteButtonTapped(id: String)
}

class FavoritesInteractor: FavoritesInteractorProtocol {

    // MARK: Properties

    private var presenter: FavoritesPresenterProtocol
    private let localDBManager: LocalDataBaseManagerProtocol

    private var offlineFavorites: [BookModel] = []

    // MARK: DI

    init(

        presenter: FavoritesPresenterProtocol,
        localDBManager: LocalDataBaseManagerProtocol
    ) {
        self.presenter = presenter
        self.localDBManager = localDBManager
    }

    // MARK: ViewDidLoad

    func handleViewDidLoad() {
        offlineFavorites = localDBManager.fetchBooks().filter({ $0.isFavorite == true })
        guard !offlineFavorites.isEmpty else {
            presenter.presentEmptyFavorites()
            return
        }
        presenter.present(favorites: offlineFavorites)
    }

    func handleFavoriteButtonTapped(id: String) {
        let book = localDBManager.fetchBooks().first(where: { $0.id == id })
        guard let book = book else { return }
        localDBManager.updateBookToFavorite(
            book: book,
            isFavorite: !book.isFavorite
        )
        offlineFavorites = localDBManager.fetchBooks().filter({ $0.isFavorite == true })
        presenter.present(favorites: offlineFavorites)
    }
}

