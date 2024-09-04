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
    func refresh()

    //    var selectedIndex: Int { get }
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
            let tabBarItem = UITabBarItem(title: nil, image: $0.icon, tag: $0.tag)
            vc.tabBarItem = tabBarItem
            return vc
        }

        self.tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(
            color: .black,
            size: CGSize(width: 28, height: 36),
            lineWidth: 3
        )
    }

    func refresh() {
        viewControllers?.forEach({
            guard let nav = $0 as? AppNavigationController else { return }
            if let home = nav.topViewController as? HomeViewController {
                home.refresh()
            }
        })
    }
}
