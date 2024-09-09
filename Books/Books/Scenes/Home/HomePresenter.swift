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
    func presentFilteredBook(books: [BookResponse])
}

class HomePresenter: HomePresenterProtocol {
    weak var viewController: HomeViewControllerProtocol?

    // MARK: DI

    func set(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }


    // MARK: Presentation

    func presentBooks(books: [BookResponse]) {
      let booksModel = createBooksModel(from: books)
        viewController?.displayBooks(with: booksModel)
    }

    func presentFilteredBook(books: [BookResponse]) {
       let filterdBooks = createBooksModel(from: books)
        viewController?.displayFilteredBooks(with: filterdBooks)
    }

    private func createBooksModel(from response: [BookResponse]) -> [BookModel] {
        var booksModel: [BookModel] = []
        response.forEach {
            let bookModel = BookModel(id: $0.id,
                                      title: $0.title,
                                      author: $0.author,
                                      imageURL: $0.imageURL.orEmptyString,
                                      bookDescription: $0.bookDescription,
                                      isFavorite: false)
            booksModel.append(bookModel)
        }
        return booksModel
    }
}
