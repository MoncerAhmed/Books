//
//  ClientError.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation

enum ClientError: AppError {

    case unknownError
    case literal(errorMessage: String)

    var title: String { return "Oops!" }

    var description: String {
        switch self {
        case .literal(let errorMessage): return errorMessage
        case .unknownError: return "Unknown Error"
        }
    }
}
