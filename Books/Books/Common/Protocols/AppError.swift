//
//  AppError.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

// An error that is related to the app and needs to be shown to the user.
protocol AppError: Error {
    var title: String { get }
    var description: String { get }
}
