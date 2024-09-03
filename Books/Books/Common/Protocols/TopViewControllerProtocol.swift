//
//  TopViewControllerProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol TopViewControllerProviderProtocol {
    func topViewController() -> UIViewControllerRouting?
}

class TopViewControllerProvider: TopViewControllerProviderProtocol {

    private let application: UIApplicationProtocol

    init(application: UIApplicationProtocol) {
        self.application = application
    }

    func topViewController() -> UIViewControllerRouting? {
        return application.topViewController(controller: nil)
    }
}
