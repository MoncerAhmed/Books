//
//  NSManagedObjectContextMock.swift
//  BooksTests
//
//  Created by Ahmed Moncer on 11/09/2024.
//

import CoreData

class NSManagedObjectContextMock: NSManagedObjectContext {

    var saved = false
    var changes = false

    override init(concurrencyType ct: NSManagedObjectContextConcurrencyType) {
        super.init(concurrencyType: ct)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func save() throws {
        saved = true
    }

    override var hasChanges: Bool {
        return changes
    }

    override func delete(_ object: NSManagedObject) {
        super.delete(object)
        changes = true
    }

    override func insert(_ object: NSManagedObject) {
        super.insert(object)
        changes = true
    }
}
