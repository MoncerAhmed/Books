//
//  BookDetailsPresenter.swift
//  Books
//
//  Created by Ahmed Moncer on 05/09/2024.
//

import UIKit

protocol BookDetailsPresenterProtocol {
    func set(viewController: BookDetailsViewControllerProtocol)
}

class BookDetailsPresenter: BookDetailsPresenterProtocol {

    weak var viewController: BookDetailsViewControllerProtocol?

    // MARK: DI

    func set(viewController: BookDetailsViewControllerProtocol) {
        self.viewController = viewController
    }
}
