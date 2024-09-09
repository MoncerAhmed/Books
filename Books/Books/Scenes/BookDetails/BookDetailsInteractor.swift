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
        presenter?.present(book: book)
        self.book? = book
    }

    func handleFavoriteButtonTapped() {
        guard let book = book else { return }
        !book.isFavorite ? localDBManager.addBook(book: book) : localDBManager.deleteBook(book: book)
        presenter?.presentFavoriteButton(isFavorite: book.isFavorite)
    }
}
