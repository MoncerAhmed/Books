//
//  ProviderError.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation

enum ProviderError: AppError {

    case noInternetConnection

    var title: String { "Oops!" }

    var description: String { "No Internet Connection"}
}
