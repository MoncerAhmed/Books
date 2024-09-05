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

//    private let favoriteService: FavoritesServiceProtocol
    private var presenter: FavoritesPresenterProtocol
    private let errorHandler: ErrorHandlerProtocol


    // MARK: DI

    init(
        presenter: FavoritesPresenterProtocol,
        errorHandler: ErrorHandlerProtocol
    ) {
        self.presenter = presenter
        self.errorHandler = errorHandler
        //        self.favoriteService = favoriteService
    }

    // MARK: ViewDidLoad

    func handleViewDidLoad() {
    }
}

