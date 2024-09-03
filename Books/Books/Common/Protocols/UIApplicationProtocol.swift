//
//  UIApplicationProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol UIApplicationProtocol {

    var keyWindow: UIWindow? { get }
    var rootViewController: UIViewController? { get set }
    func topViewController(controller: UIViewController?) -> UIViewController?
}

extension UIApplication: UIApplicationProtocol {

    var rootViewController: UIViewController? {
        get { return windows.first?.rootViewController }
        set { windows.first?.rootViewController = newValue }
    }

    func topViewController(controller: UIViewController?) -> UIViewController? {
        var base: UIViewController?
        if controller == nil {
            base = rootViewController
        } else { base = controller }

        if let navigationController = base as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let presented = base?.presentedViewController {
            return topViewController(controller: presented)
        }
        return base
    }

}
