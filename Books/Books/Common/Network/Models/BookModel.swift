//
//  BookModel.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation

struct BookModel: Codable {
    let id: String
    let title: String
    let author: String
    let imageURL: String
    let description: String
    var isFavorite: Bool
}
