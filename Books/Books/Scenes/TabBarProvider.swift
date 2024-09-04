//
//  TabBarProvider.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol TabBarViewModelProviderProtocol {
    func viewModel(for item: TabBarItem) -> TabBarItemViewModel
}

class TabBarViewModelProvider: TabBarViewModelProviderProtocol {

    private let homeStoryboard: Storyboard
    private let favoritesStoryboard: Storyboard
    private let settingsStoryboard: Storyboard

    init(
        homeStoryboard: Storyboard,
        favoritesStoryboard: Storyboard,
        settingsStoryboard: Storyboard
    ) {
        self.homeStoryboard = homeStoryboard
        self.favoritesStoryboard = favoritesStoryboard
        self.settingsStoryboard = settingsStoryboard
    }

    func viewModel(for item: TabBarItem) -> TabBarItemViewModel {
        var storyboard: Storyboard?
        switch item {
        case .home: storyboard = homeStoryboard
        case .favorites: storyboard = favoritesStoryboard
        case .settings: storyboard = settingsStoryboard
        }

        return TabBarItemViewModel(
            icon: item.icon,
            title: item.title,
            viewController: storyboard?.initial(),
            tag: item.tag)
    }
}
