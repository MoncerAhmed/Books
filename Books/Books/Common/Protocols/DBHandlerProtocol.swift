//
//  DBHandlerProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import Foundation
import Combine

protocol DBHandlerProtocol {
    func saveBooks(data: [BookModel])
    func prepareLocalData()

    var dbInfo: String { get }
    var booksPublisher: AnyPublisher<[BookModel], Never> { get }
}
