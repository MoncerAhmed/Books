//
//  LocalDataBaseManager.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import UIKit
import CoreData

protocol LocalDataBaseManagerProtocol {
    func addBook(book: BookModel)
    func addBooks(books: [BookModel])
    func deleteBook(book: BookModel)
    func fetchBooks() -> [BookModel]
}

class LocalDataBaseManager: LocalDataBaseManagerProtocol {

    // MARK: - Core Data Context
    let container: NSPersistentContainerProtocl
    var context: NSManagedObjectContext

    init(container: NSPersistentContainerProtocl) {
        self.container = container
        self.context = container.viewContext


    }

    // MARK: - Add Single Book
    func addBook(book: BookModel) {
        let newBook = BooksCD(context: context)
        newBook.id = book.id
        newBook.title = book.title
        newBook.author = book.author
        newBook.imageURL = book.imageURL
        newBook.bookDescription = book.description
        newBook.isFavorite = book.isFavorite

        saveContext()
    }

    // MARK: - Add Array of Books
    func addBooks(books: [BookModel]) {
        for book in books {
            let newBook = BooksCD(context: context)
            newBook.id = book.id
            newBook.title = book.title
            newBook.author = book.author
            newBook.imageURL = book.imageURL
            newBook.bookDescription = book.description
            newBook.isFavorite = book.isFavorite
        }
        saveContext()
    }

    // MARK: - Delete Book
    func deleteBook(book: BookModel) {
        let bookToDelete = BooksCD(context: context)
        bookToDelete.id = book.id
        bookToDelete.title = book.title
        bookToDelete.author = book.author
        bookToDelete.imageURL = book.imageURL
        bookToDelete.bookDescription = book.description
        bookToDelete.isFavorite = book.isFavorite
        context.delete(bookToDelete)
        saveContext()
    }

    // MARK: - Fetch All Books
    func fetchBooks() -> [BookModel] {
        let request: NSFetchRequest<BooksCD> = BooksCD.fetchRequest()
        do {
            var booksToBeDisplayed: [BookModel] = []
            let books = try context.fetch(request)
            books.forEach {
                let book = BookModel(
                    id: $0.id,
                    title: $0.title,
                    author: $0.author,
                    imageURL: $0.imageURL,
                    description: $0.description,
                    isFavorite: $0.isFavorite
                )
                booksToBeDisplayed.append(book)
            }
            return booksToBeDisplayed
        } catch {
            print("Error fetching books: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Update Book and Mark as Favorite
    func updateBookToFavorite(book: BooksCD) {
        book.isFavorite = true
        saveContext()
    }

    // MARK: - Save Context
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
}
