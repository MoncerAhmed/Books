//
//  LocalDataBaseManager.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import Foundation
import Combine

protocol LocalDataBaseManagerProtocol {
    func prepareDB()
    func syncData(_ data: [BookModel])

    var booksPublisher: AnyPublisher<[BookModel], Never> { get }
}

class LocalDataBaseManager: LocalDataBaseManagerProtocol {
    let dbHandler: DBHandlerProtocol

    var booksPublisher: AnyPublisher<[BookModel], Never> { dbHandler.booksPublisher
        .receive(on: DispatchQueue.main).eraseToAnyPublisher() }


    init(dbHandler: DBHandlerProtocol) {
        self.dbHandler = dbHandler
    }

    func syncData(_ data: [BookModel]) {
        dbHandler.saveBooks(data: data)
    }

    func prepareDB() {
        Micro.log("Preparing db")
        Micro.log(dbHandler.dbInfo)
        dbHandler.prepareLocalData()
    }
}
