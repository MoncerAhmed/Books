//
//  FavoritesInteractor.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import Nuke
import Combine
import UIKit

//sourcery: AutoMockable
protocol FavoritesInteractorProtocol {
    func handleViewDidLoad()
}

class FavoritesInteractor: FavoritesInteractorProtocol {

    // MARK: Properties

    private var presenter: FavoritesPresenterProtocol
    private let errorHandler: ErrorHandlerProtocol
    private let localDBManager: LocalDataBaseManagerProtocol
    private var anyCancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    private var localFavorites: [BookModel] = []

    // MARK: DI

    init(
        presenter: FavoritesPresenterProtocol,
        errorHandler: ErrorHandlerProtocol,
        localDBManager: LocalDataBaseManagerProtocol
    ) {
        self.presenter = presenter
        self.errorHandler = errorHandler
        self.localDBManager = localDBManager
    }

    // MARK: ViewDidLoad

    func handleViewDidLoad() {
        localDBManager.prepareDB()
        subscribeToFavorites()
        localDBManager.
    }
}

extension FavoritesInteractor {
    // Offline data fetching
    fileprivate func subscribeToFavorites() {
        localDBManager.booksPublisher.sink { [weak self, presenter] books in
            self?.localFavorites = books.filter { $0.isFavorite }
            guard let favorites = self?.localFavorites,
                  !favorites.isEmpty else {
                return
            }
            presenter.present(favorites: favorites)
        }.store(in: &anyCancellables)
    }
}
