//
//  TabBarItem.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import Foundation
import UIKit

enum TabBarItem: Equatable, CaseIterable {

    case home
    case favorites
    case settings

    var icon: UIImage {
        switch self {
        case .home:
            return R.image.houseInactive()!
        case .favorites:
            return R.image.heartInactive()!
        case .settings:
            return R.image.settingsInactive()!
        }
    }

    var selectedIcon: UIImage {
        switch self {
        case .home:
            return R.image.houseActive()!
        case .favorites:
            return R.image.heartActive()!
        case .settings:
            return R.image.settingsActive()!
        }
    }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .settings:
            return "Settings"
        }
    }

    var tag: Int {
        switch self {
        case .home:
            return 0
        case .favorites:
            return 1
        case .settings:
            return 2
        }
    }
}

// swiftlint:enable nesting
struct TabBarItemViewModel: Equatable {
    let icon: UIImage
    let title: String
    let viewController: UIViewController?
    let tag: Int
}
