//
//  HomeStoryboardId.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

enum HomeStoryboardId: StoryboardId {

    case details

    var identifier: String {
        switch self {
        case .details:
            // TODO: replace home with details identifier after creating the details screen
            return R.storyboard.home.homeViewController.identifier
        }
    }
}
