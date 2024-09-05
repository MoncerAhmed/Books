//
//  TabBarViewController.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol TabBarViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: TabBarInteractorProtocol)
    func setupTabbar(items: [TabBarItemViewModel])
    func select(index: Int)

    var viewControllers: [UIViewController]? { get }
}

class TabBarViewController: UITabBarController, TabBarViewControllerProtocol {

    // MARK: Properties

    var interactor: TabBarInteractorProtocol?

    // MARK: DI

    func set(interactor: TabBarInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handleViewDidLoad()
    }

    // MARK: Actions

    func select(index: Int) {
        selectedIndex = index
    }
}

// MARK: Methods

extension TabBarViewController {
    func getViewController(at index: Int) -> UIViewController? {
        guard index - 1 <= viewControllers?.count ?? 0 else { return nil }
        return viewControllers?[index]
    }

    func setupTabbar(items: [TabBarItemViewModel]) {
        viewControllers = items.map {
            guard let vc = $0.viewController else {
                assertionFailure()
                return UIViewController()
            }
            let tabBarItem = UITabBarItem(title: $0.title, image: $0.icon, tag: $0.tag)
            vc.tabBarItem = tabBarItem
            return vc
        }
    }
}
