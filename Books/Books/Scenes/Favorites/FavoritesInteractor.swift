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
        presenter.present(favorites: offlineFavorites)
    }
}

