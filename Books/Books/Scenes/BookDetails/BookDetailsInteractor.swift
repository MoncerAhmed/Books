//
//  BookDetailsInteractor.swift
//  Books
//
//  Created by Ahmed Moncer on 05/09/2024.
//

import UIKit
import Combine

protocol BookDetailsInteractorProtocol {
    func handleBookDetail(with book: BookModel)
    func handleFavoriteButtonTapped()
}

class BookDetailsInteractor: BookDetailsInteractorProtocol {
    private var presenter: BookDetailsPresenterProtocol?
    private let localDBManager: LocalDataBaseManagerProtocol

    private var book: BookModel?

    init(
        presenter: BookDetailsPresenterProtocol,
        localDBManager: LocalDataBaseManagerProtocol
    ) {
        self.presenter = presenter
        self.localDBManager = localDBManager
    }

    func handleBookDetail(with book: BookModel) {
        self.book = book
        let offlineBook = localDBManager.fetchBooks().first(where: { $0.id == book.id })
        guard let offlineBook = offlineBook else {
            presenter?.present(book: book)
            presenter?.presentFavoriteButton(isFavorite: book.isFavorite)
            return
        }
        presenter?.present(book: offlineBook)
        presenter?.presentFavoriteButton(isFavorite: offlineBook.isFavorite)
    }

    func handleFavoriteButtonTapped() {
        guard let book = book else { return }

        let offlineBook = localDBManager.fetchBooks().first(where: { $0.id == book.id })
        guard var bookToDisplay = offlineBook else {
            localDBManager.updateBookToFavorite(
                book: book,
                isFavorite: !book.isFavorite
            )
            presenter?.presentFavoriteButton(isFavorite: book.isFavorite)
            return
        }
        localDBManager.updateBookToFavorite(
            book: bookToDisplay,
            isFavorite: !bookToDisplay.isFavorite
        )
        presenter?.presentFavoriteButton(isFavorite: !bookToDisplay.isFavorite)
    }
}
