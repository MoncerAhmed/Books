//
//  BooksTarget.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Moya

enum BooksTarget: TargetType {

    case books

    var baseURL: URL {
        switch self {
        case .books:
            return Constants.URLs.apiURL!
        }
    }

    var path: String {
        switch self {
        case .books:
            return "/getBooks" }
        }

    var method: Method { return .get }

    var sampleData: Data { return Data() }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? { return nil }
}
