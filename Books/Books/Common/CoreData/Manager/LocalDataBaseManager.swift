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
    func deleteBook(book: BooksCD)
    func fetchBooks() -> [BookModel]
    func updateBookToFavorite(book: BookModel, isFavorite: Bool)

    var context: NSManagedObjectContext { get set }
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
        newBook.update(with: book)
        saveContext()
    }

    // MARK: - Add Array of Books
    func addBooks(books: [BookModel]) {
        for book in books {
            let newBook = BooksCD(context: context)
            newBook.update(with: book)
        }
        saveContext()
    }

    // MARK: - Delete Book
    func deleteBook(book: BooksCD) {
        context.delete(book)
        saveContext()
    }

    // MARK: - Fetch All Books
    func fetchBooks() -> [BookModel] {
        let request: NSFetchRequest<BooksCD> = BooksCD.fetchRequest()
        do {
            let booksCD = try context.fetch(request)
            return booksCD.map { BookModel(fromCoreData: $0) }
        } catch {
            print("Error fetching books: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Update Book and Mark as Favorite
    func updateBookToFavorite(book: BookModel, isFavorite: Bool) {
        let request: NSFetchRequest<BooksCD> = BooksCD.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", book.id)

        do {
            if let bookCD = try context.fetch(request).first {
                bookCD.isFavorite = isFavorite
                saveContext()
            } else {
                addBook(book: book)    
            }
        } catch {
            print("Error updating book: \(error.localizedDescription)")
        }
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
