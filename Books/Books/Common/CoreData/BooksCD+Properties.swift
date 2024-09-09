//
//  BooksCD+Properties.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import Foundation
import CoreData

extension BooksCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BooksCD> {
        return NSFetchRequest<BooksCD>(entityName: "BooksCD")
    }

    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var author: String
    @NSManaged public var imageURL: String
    @NSManaged public var bookDescription: String
    @NSManaged public var isFavorite: Bool
}

extension BooksCD {
    // Update Core Data entity with BookModel data
    func update(with model: BookModel) {
        self.id = model.id
        self.title = model.title
        self.author = model.author
        self.imageURL = model.imageURL
        self.bookDescription = model.bookDescription
        self.isFavorite = model.isFavorite
    }
}

extension BooksCD: Identifiable {}
