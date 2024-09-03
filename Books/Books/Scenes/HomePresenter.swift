//
//  HomePresenter.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

protocol HomePresenterProtocol {
    func set(viewController: HomeViewControllerProtocol)
    func presentNoInternet(connected: Bool)
}

class HomePresenter: HomePresenterProtocol {
    weak var viewController: HomeViewControllerProtocol?

    // MARK: DI

    func set(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }

    func presentNoInternet(connected: Bool) {
        viewController?.displayNoInternet(connected: connected)
    }
}
