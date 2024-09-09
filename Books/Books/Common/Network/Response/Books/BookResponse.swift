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
    let imageURL: String?
    let bookDescription: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case imageURL = "coverImageURL"
        case bookDescription = "description"
    }
}
