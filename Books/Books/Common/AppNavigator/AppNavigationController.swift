//
//  AppNavigationController.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

/// Class that handles the Navigation bar Look for the app.
class AppNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareStyle()
    }

    func prepareStyle() {
        navigationBar.backgroundColor = .clear
        navigationBar.barTintColor = .clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.barStyle = .default
        navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.backBarButtonItem?.image = #imageLiteral(resourceName: "back-arrow")
        navigationBar.layoutIfNeeded()

        navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back-arrow")
        navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back-arrow")

        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont(descriptor: .init(), size: 20)
        ]
        navigationBar.titleTextAttributes = textAttributes

        delegate = self

        setupTitleAttributes()
    }

    private func setupTitleAttributes() {
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont(descriptor: .init(), size: 20),
            .foregroundColor: UIColor.black
        ]

        UINavigationBar.appearance().titleTextAttributes = attrs
    }
}

extension AppNavigationController: UINavigationControllerDelegate {

    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool) {
            viewController.navigationItem.backBarButtonItem = .init(
                title: " ",
                style: .plain,
                target: nil,
                action: nil)
        }
}
