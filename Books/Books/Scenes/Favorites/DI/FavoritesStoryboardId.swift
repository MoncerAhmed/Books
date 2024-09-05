//
//  FavoritesStoryboardId.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import Foundation

enum FavoritesStoryboardId: StoryboardId {

    case favorites
    case bookDetails

    var identifier: String {
        switch self {
        case .favorites:
            return R.storyboard.favorites.favoritesViewController.identifier
        case .bookDetails:
//            return R.storyboard.favorites.bookDetailsViewController.identifier
            return ""
        }
    }
}
