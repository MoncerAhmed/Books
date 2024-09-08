//
//  NSPersistentContainerProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import CoreData

protocol NSPersistentContainerProtocl {
    var viewContext: NSManagedObjectContext { get }
    var persistentStoreDescriptions: [NSPersistentStoreDescription] { get }

    @available(iOS 13.0, *)
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void)
    @available(iOS 15.0, *)
    func performBackgroundTask<T>(_ block: @escaping (NSManagedObjectContext) throws -> T) async rethrows -> T
    func newBackgroundContext() -> NSManagedObjectContext
}

extension NSPersistentContainer: NSPersistentContainerProtocl {}
