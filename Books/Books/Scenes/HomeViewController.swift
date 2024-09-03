//
//  HomeViewController.swift.swift
//  Books
//
//  Created by Ahmed Moncer on 02/09/2024.
//

import UIKit
import WebKit

protocol HomeViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: HomeInteractorProtocol)
    func set(router: HomeRouterProtocol)
    func displayNoInternet(connected: Bool)
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    private var interactor: HomeInteractorProtocol?
    private var router: HomeRouterProtocol?

    // MARK: Outlets


    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handleViewDidLoad()
        setupUI()
    }

    // MARK: DI

    func set(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: HomeRouterProtocol) {
        self.router = router
    }

    func setupUI() {
    }

    // MARK: Display
    func displayNoInternet(connected: Bool) {
        DispatchQueue.main.async { [weak self] in
//            self?.noInternetView.isHidden = connected
        }
    }
}


