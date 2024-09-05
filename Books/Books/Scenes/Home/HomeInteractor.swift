//
//  HomeInteractor.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit
import Combine

protocol HomeInteractorProtocol {
    func handleViewDidLoad()
}

class HomeInteractor: HomeInteractorProtocol {

    // MARK: - Private

    private var presenter: HomePresenterProtocol?
    private let booksService: BooksServiceProtocol
    private let errorHandler: ErrorHandlerProtocol
    private var anyCancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    private var books: [BookResponse] = []

    init(
        presenter: HomePresenterProtocol,
        booksService: BooksServiceProtocol,
        errorHandler: ErrorHandlerProtocol
    ) {
        self.presenter = presenter
        self.booksService = booksService
        self.errorHandler = errorHandler
    }

    func handleViewDidLoad() {
        booksService.getBooks()
            .sink(receiveCompletion: {[weak self, errorHandler] completion in
                guard let self = self else { return assertionFailure() }
                switch completion {
                case .failure(let error):
                    errorHandler.handle(error)
                case .finished:
                    presenter?.presentBooks(books: self.books)
                }
            }, receiveValue: { response in
                self.books = response
            })
            .store(in: &anyCancellables)
    }
}
