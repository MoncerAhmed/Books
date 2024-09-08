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

    private var book: BookModel?

    init(
        presenter: BookDetailsPresenterProtocol
    ) {
        self.presenter = presenter
    }

    func handleBookDetail(with book: BookModel) {
        presenter?.present(book: book)
        self.book? = book
    }

    func handleFavoriteButtonTapped() {
        guard var isFavorite = book?.isFavorite else { return }
        isFavorite.toggle() // can be tested after favorites implementation
        presenter?.presentFavoriteButton(isFavorite: isFavorite)
    }
}
