//
//  BookDetailsRouter.swift
//  Books
//
//  Created by Ahmed Moncer on 05/09/2024.
//

import UIKit

protocol BookDetailsRouterProtocol {
    func set(viewController: BookDetailsViewControllerProtocol)
    func route(to scene: BookDetailsRouter.Scene)
}

class BookDetailsRouter: NSObject, BookDetailsRouterProtocol {

    weak var viewController: BookDetailsViewControllerProtocol?

    func set(viewController: BookDetailsViewControllerProtocol) {
        self.viewController = viewController
    }

    enum Scene {
        case back
    }

    func route(to scene: BookDetailsRouter.Scene) {
        switch scene {
        case .back:
            viewController?.dismiss(animated: true, completion: nil)
        }
    }
}
