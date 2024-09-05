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
}

class BookDetailsInteractor: BookDetailsInteractorProtocol {
    private var presenter: BookDetailsPresenterProtocol?

    init(
        presenter: BookDetailsPresenterProtocol
    ) {
        self.presenter = presenter
    }
    func handleBookDetail(with book: BookModel) {
        presenter?.present(book: book)
    }
}
