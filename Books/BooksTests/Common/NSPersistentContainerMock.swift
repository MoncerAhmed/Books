//
//  NSPersistentContainerMock.swift
//  BooksTests
//
//  Created by Ahmed Moncer on 11/09/2024.
//

import CoreData
@testable import Books

class MockPersistentContainer: NSPersistentContainerProtocl {

    var viewContext: NSManagedObjectContext
    var persistentStoreDescriptions: [NSPersistentStoreDescription]

    init() {
        self.viewContext = NSManagedObjectContextMock(concurrencyType: .mainQueueConcurrencyType)
        self.persistentStoreDescriptions = []
    }

    @available(iOS 13.0, *)
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        let backgroundContext = NSManagedObjectContextMock(concurrencyType: .privateQueueConcurrencyType)
        block(backgroundContext)
    }

    @available(iOS 15.0, *)
    func performBackgroundTask<T>(_ block: @escaping (NSManagedObjectContext) throws -> T) async rethrows -> T {
        let backgroundContext = NSManagedObjectContextMock(concurrencyType: .privateQueueConcurrencyType)
        return try block(backgroundContext)
    }

    func newBackgroundContext() -> NSManagedObjectContext {
        return NSManagedObjectContextMock(concurrencyType: .privateQueueConcurrencyType)
    }
}
