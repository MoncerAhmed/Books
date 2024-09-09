//
//  HomePresenter.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

protocol HomePresenterProtocol {
    func set(viewController: HomeViewControllerProtocol)
    func presentBooks(books: [BookResponse])
}

class HomePresenter: HomePresenterProtocol {
    weak var viewController: HomeViewControllerProtocol?

    // MARK: DI

    func set(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }


    // MARK: Presentation

    func presentBooks(books: [BookResponse]) {
        var booksModel: [BookModel] = []
        books.forEach {
            let bookModel = BookModel(id: $0.id,
                                      title: $0.title,
                                      author: $0.author,
                                      imageURL: $0.imageURL.orEmptyString,
                                      bookDescription: $0.bookDescription,
                                      isFavorite: false)
            booksModel.append(bookModel)
        }
        viewController?.displayBooks(with: booksModel)
    }
}
