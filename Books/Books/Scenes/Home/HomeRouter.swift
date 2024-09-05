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

    // MARK: - Private
    weak var viewController: HomeViewControllerProtocol?

    private let detailsStoryboard: Storyboard

    init(detailsStoryboard: Storyboard) {
        self.detailsStoryboard = detailsStoryboard
    }

    enum Scene {
        case details(book: BookModel)
    }

    func set(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }

    func route(to scene: HomeRouter.Scene) {
        switch scene {        
        case .details(let book):
            guard let vc = detailsStoryboard.viewController(identifier: HomeStoryboardId.details) as? BookDetailsViewController
            else { return }
            vc.setBook(with: book)
            vc.modalPresentationStyle = .fullScreen
            viewController?.present(vc, animated: true, completion: nil)
        }
    }
}
