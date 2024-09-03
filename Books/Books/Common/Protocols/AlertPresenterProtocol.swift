//
//  AlertPresenterProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol AlertPresenterProtocol {
    func presentAlert(
        title: String?,
        description: String?,
        actions: [UIAlertAction]
    )
}

class AlertPresenter: AlertPresenterProtocol {

    private let topViewControllerProvider: TopViewControllerProviderProtocol

    init(topViewControllerProvider: TopViewControllerProviderProtocol) {
        self.topViewControllerProvider = topViewControllerProvider
    }


    func presentAlert(
        title: String?,
        description: String?,
        actions: [UIAlertAction]
    ) {
        let alert = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        actions.forEach { alert.addAction($0) }
        topViewControllerProvider.topViewController()?.present(
            alert,
            animated: true,
            completion: nil
        )
    }
}
