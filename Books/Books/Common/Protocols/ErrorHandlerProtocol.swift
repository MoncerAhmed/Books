//
//  ErrorHandlerProtocol.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol ErrorHandlerProtocol {
    func handle(_ error: Error)
}

class ErrorHandler: ErrorHandlerProtocol {

    private let alertPresenter: AlertPresenterProtocol

    init(alertPresenter: AlertPresenterProtocol) {
        self.alertPresenter = alertPresenter
    }

    func handle(_ error: Error) {
        guard let appError = error as? AppError else {
            print(error.localizedDescription)
            return
        }
        let okAction = UIAlertAction(
            title: "ok",
            style: .default,
            handler: nil
        )
        alertPresenter.presentAlert(
            title: appError.title,
            description: appError.description,
            actions: [okAction]
        )
    }
}
