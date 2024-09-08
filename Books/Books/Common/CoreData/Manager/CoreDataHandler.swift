//
//  CoreDataHandler.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import CoreData
import Combine

class CoreDataHandler: DBHandlerProtocol, ObservableObject {
    var dbInfo: String {
        return "Core Data DB Handler"
    }

    @Published var books: [BookModel] = []

    var booksPublisher: AnyPublisher<[BookModel], Never> { $books.eraseToAnyPublisher() }

    private var anyCancellables = Set<AnyCancellable>()

    let booksRepo: CoreDataRepository<BooksCD>


    init(container: NSPersistentContainerProtocl) {
        self.booksRepo = CoreDataRepository<BooksCD>(context: container.viewContext)
    }

    func saveBooks(data: [BookModel]) {
        books = data
        data
            .publisher
            .flatMap { book in
                return Future<(BooksCD, BookModel), Never> { [self] completion in
                    self.saveBook(book)
                        .sink(receiveValue: { bookCD in
                            completion(.success(bookCD))
                        }).store(in: &anyCancellables)
                }.eraseToAnyPublisher()
            }
            .flatMap { (bookCd, bookModel) in
                return Future<Void,Never> { [self] completion in
                    self.saveBook(bookModel)
                        .sink { _ in
                            completion(.success(()))
                        }.store(in: &anyCancellables)
                }
            }
            .sink { [self] _ in
                Micro.log("Finished saving Books")
                booksRepo.persistData()
            }.store(in: &anyCancellables)
    }

    func prepareLocalData() {
        booksRepo
            .fetch(sortDescriptors: [], predicate: nil)
            .replaceError(with: [])
            .sink { [self] booksCD in
                books = booksCD.map { book in
                    return BookModel(
                        id: book.id,
                        title: book.title,
                        author: book.author,
                        imageURL: book.imageURL,
                        description: book.description,
                        isFavorite: book.isFavorite
                    )
                }
            }
            .store(in: &anyCancellables)
    }
}

extension CoreDataHandler {
    private func saveBook(_ book: BookModel) -> AnyPublisher<(BooksCD, BookModel), Never> {
        return Future <(BooksCD, BookModel), Never> { [self] completion in
            booksRepo.add { object in
                object.id = book.id
                object.title = book.title
                object.author = book.author
                object.imageURL = book.imageURL
                object.bookDescription = book.description
                object.isFavorite = book.isFavorite
            }.assertNoFailure().eraseToAnyPublisher().sink { bookCD in
                completion(.success((bookCD, book)))
            }.store(in: &anyCancellables)
        }.eraseToAnyPublisher()
    }
}
