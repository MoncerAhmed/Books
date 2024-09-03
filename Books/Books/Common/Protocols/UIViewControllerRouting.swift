//
//  UIViewControllerRouting.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol UIViewControllerRouting: AnyObject {
    func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)?
    )
    func show(_ vc: UIViewController, sender: Any?)
    func pop(animated: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)

    var tabBarController: UITabBarController? { get }
}

protocol UINavigationControllerRouting: AnyObject {
    func popViewController(animated: Bool) -> UIViewController?
    func show(_ vc: UIViewController, sender: Any?)
}

extension UIViewController: UIViewControllerRouting {
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
}
