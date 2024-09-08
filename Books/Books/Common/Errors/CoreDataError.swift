//
//  CoreDataError.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//


enum CoreDataError: AppError {
    case objectNotFound

    var title: String {
        return "Core data error"
    }

    var description: String {
        switch self {
        case .objectNotFound: return "Object was not found"
        }
    }
}
