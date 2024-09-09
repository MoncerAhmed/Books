//
//  BooksResponse.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation

struct BookResponse: Codable {
    let id: String
    let title: String
    let author: String
    let coverURL: String?
    let bookDescription: String
    let reads: String
    let reviews: String
    let summary: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case coverURL = "coverUrl"
        case bookDescription = "description"
        case reads
        case reviews
        case summary
        case createdAt
    }
}
