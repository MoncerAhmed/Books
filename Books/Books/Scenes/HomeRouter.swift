//
//  HomeRouter.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

protocol HomeRouterProtocol {
    func set(viewController: HomeViewControllerProtocol)
    func route(to scene: HomeRouter.Scene)

}

class HomeRouter: NSObject, HomeRouterProtocol{
    weak var viewController: HomeViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol

    init(rootNavigator: RootNavigatorProtocol) {
        self.rootNavigator = rootNavigator
    }

    enum Scene {
        case details
    }

    func set(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }

    func route(to scene: HomeRouter.Scene) {
        switch scene {        
        case .details:
            // TODO: change route with books details screen when implemented
            rootNavigator.setRootNavigator()
        }
    }

}
