//
//  TabBarInteractor.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol TabBarInteractorProtocol {
    func handleViewDidLoad()
}

class TabBarInteractor: NSObject, TabBarInteractorProtocol {

    // MARK: DI
    private var presenter: TabBarPresenterProtocol
    private var tabBarProviderProtocol: TabBarViewModelProviderProtocol


    init(
        presenter: TabBarPresenterProtocol,
         tabBarProviderProtocol: TabBarViewModelProviderProtocol
    ) {
        self.presenter = presenter
        self.tabBarProviderProtocol = tabBarProviderProtocol
    }

    func handleViewDidLoad() {
        prepareTabBar()
    }


    private func prepareTabBar() {
        let items = TabBarItem.allCases.map { tabBarProviderProtocol.viewModel(for: $0) }
        presenter.presentTabBarItems(items: items)
    }
}
