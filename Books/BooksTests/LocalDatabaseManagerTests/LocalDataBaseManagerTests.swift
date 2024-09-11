//
//  LocalDataBaseManagerTests.swift
//  BooksTests
//
//  Created by Ahmed Moncer on 11/09/2024.
//

import XCTest
import CoreData
@testable import Books

class LocalDataBaseManagerTests: XCTestCase {

    var mockContainer: NSPersistentContainerProtocl!
    var sut: LocalDataBaseManager!
    var mockContext: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        mockContainer = MockPersistentContainer() // Assume you have a mock for the container
        mockContext = mockContainer.viewContext
        sut = LocalDataBaseManager(container: mockContainer)
    }

    override func tearDown() {
        sut = nil
        mockContext = nil
        mockContainer = nil
        super.tearDown()
    }

    func testAddBook() {
        // Given
        let book = BookModel.mock()

        // When
        sut.addBook(book: book)

        // Then
        let request: NSFetchRequest<BooksCD> = BooksCD.fetchRequest()
        let results = try! mockContext.fetch(request)
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.title, book.title)
    }

    func testAddBooks() {
        // Given
        let books = [
            BookModel.mock(),
            BookModel.mock()
        ]

        // When
        sut.addBooks(books: books)

        // Then
        let request: NSFetchRequest<BooksCD> = BooksCD.fetchRequest()
        let results = try! mockContext.fetch(request)
        XCTAssertEqual(results.count, books.count)
    }

    func testDeleteBook() {
        // Given
        let book = BooksCD(context: mockContext)
        book.title = "To Delete"
        try! mockContext.save()

        // When
        sut.deleteBook(book: book)

        // Then
        let request: NSFetchRequest<BooksCD> = BooksCD.fetchRequest()
        let results = try! mockContext.fetch(request)
        XCTAssertEqual(results.count, 0)
    }

    func testFetchBooks() {
        // Given
        let book = BooksCD(context: mockContext)
        book.title = "To Fetch"
        try! mockContext.save()

        // When
        let books = sut.fetchBooks()

        // Then
        XCTAssertEqual(books.count, 1)
        XCTAssertEqual(books.first?.title, book.title)
    }

    func testUpdateBookToFavorite() {
        // Given
        let bookModel = BookModel.mock()
        let bookCD = BooksCD(context: mockContext)
        bookCD.id = bookModel.id

        // When
        sut.updateBookToFavorite(book: bookModel, isFavorite: true)

        // Then
        XCTAssertTrue(bookCD.isFavorite)
    }
}
