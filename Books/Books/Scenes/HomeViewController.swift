//
//  HomeViewController.swift.swift
//  Books
//
//  Created by Ahmed Moncer on 02/09/2024.
//

import UIKit

protocol HomeViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: HomeInteractorProtocol)
    func set(router: HomeRouterProtocol)
    func set(imageLoader: ImageLoaderProtocol)
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    private var interactor: HomeInteractorProtocol?
    private var router: HomeRouterProtocol?
    private var imageLoader: ImageLoaderProtocol?

    var booksDataSource = BooksDataSource()

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

    func set(imageLoader: ImageLoaderProtocol) {
        self.imageLoader = imageLoader
    }

    // MARK: Setup

    func setupUI() {
        // TODO: setup UI elements
    }

    // MARK: Display
    func displayBooks() {
        // TODO: handle books display in collectionView
    }
}


