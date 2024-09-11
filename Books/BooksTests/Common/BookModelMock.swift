//
//  BookModelMock.swift
//  BooksTests
//
//  Created by Ahmed Moncer on 11/09/2024.
//

@testable import Books

extension BookModel  {
    static func mock() -> Self {
        return BookModel(
            id: "1",
            title: "title mock",
            author: "author mock",
            coverURL: "123dkfjdk",
            bookDescription: "description mock",
            reads: "9",
            reviews: "12",
            summary: "summary mock",
            createdAt: "01-01-2025",
            isFavorite: false
        )
    }
}
