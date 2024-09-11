//
//  LocalDataBaseManagerMock.swift
//  BooksTests
//
//  Created by Ahmed Moncer on 11/09/2024.
//

import CoreData
@testable import Books

class MockLocalDataBaseManager: LocalDataBaseManagerProtocol {

    var context: NSManagedObjectContext
    var addBookCalled = false
    var addBooksCalled = false
    var deleteBookCalled = false
    var fetchBooksCalled = false
    var updateBookToFavoriteCalled = false

    var addedBook: BookModel?
    var addedBooks: [BookModel] = []
    var deletedBook: BooksCD?
    var favoriteBook: BookModel?
    var isFavoriteFlag: Bool = false

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func addBook(book: BookModel) {
        addBookCalled = true
        addedBook = book
    }

    func addBooks(books: [BookModel]) {
        addBooksCalled = true
        addedBooks = books
    }

    func deleteBook(book: BooksCD) {
        deleteBookCalled = true
        deletedBook = book
    }

    func fetchBooks() -> [BookModel] {
        fetchBooksCalled = true
        return []
    }

    func updateBookToFavorite(book: BookModel, isFavorite: Bool) {
        updateBookToFavoriteCalled = true
        favoriteBook = book
        isFavoriteFlag = isFavorite
    }
}
