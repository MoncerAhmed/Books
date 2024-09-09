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
    private let errorHandler: ErrorHandlerProtocol

    private var localFavorites: [BookModel] = []

    // MARK: DI

    init(

        presenter: FavoritesPresenterProtocol,
        errorHandler: ErrorHandlerProtocol
    ) {
        self.presenter = presenter
        self.errorHandler = errorHandler
    }

    // MARK: ViewDidLoad

    func handleViewDidLoad() {
    }
}

