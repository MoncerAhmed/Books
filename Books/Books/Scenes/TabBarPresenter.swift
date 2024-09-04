//
//  TabBarPresenter.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol TabBarPresenterProtocol {
    func set(viewController: TabBarViewControllerProtocol?)
    func presentTabBarItems(items: [TabBarItemViewModel])
}

class TabBarPresenter: TabBarPresenterProtocol {

    // MARK: DI
    weak var viewController: TabBarViewControllerProtocol?

    func set(viewController: TabBarViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  TabBarPresenter {
    func presentTabBarItems(items: [TabBarItemViewModel]) {
        viewController?.setupTabbar(items: items)
    }
}
