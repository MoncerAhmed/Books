//
//  BookModel.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation

struct BookModel: Codable, Equatable {
    let id: String
    let title: String
    let author: String
    let coverURL: String
    let bookDescription: String
    let reads: String
    let reviews: String
    let summary: String
    let createdAt: String
    var isFavorite: Bool
}

extension BookModel: Hashable {
    // Convert Core Data object (BooksCD) to BookModel
    init(fromCoreData bookCD: BooksCD) {
        self.id = bookCD.id
        self.title = bookCD.title
        self.author = bookCD.author
        self.coverURL = bookCD.coverURL
        self.bookDescription = bookCD.bookDescription
        self.reads = bookCD.reads
        self.reviews = bookCD.reviews
        self.summary = bookCD.summary
        self.createdAt = bookCD.createdAt
        self.isFavorite = bookCD.isFavorite
    }
}
