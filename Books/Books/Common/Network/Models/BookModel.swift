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
    let imageURL: String
    let bookDescription: String
    var isFavorite: Bool
}

extension BookModel: Hashable {
    // Convert Core Data object (BooksCD) to BookModel
    init(fromCoreData bookCD: BooksCD) {
        self.id = bookCD.id
        self.title = bookCD.title
        self.author = bookCD.author
        self.imageURL = bookCD.imageURL
        self.bookDescription = bookCD.bookDescription
        self.isFavorite = bookCD.isFavorite
    }
}
