//
//  BookDetailsViewController.swift
//  Books
//
//  Created by Ahmed Moncer on 05/09/2024.
//

import UIKit

protocol BookDetailsViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: BookDetailsInteractorProtocol)
    func set(router: BookDetailsRouterProtocol)
    func set(imageLoader: ImageLoaderProtocol)

    func setBook(with book: BookModel)
}

class BookDetailsViewController: UIViewController, BookDetailsViewControllerProtocol {

    // MARK: Private

    private var interactor: BookDetailsInteractorProtocol?
    private var router: BookDetailsRouterProtocol?
    private var imageLoader: ImageLoaderProtocol?


    // MARK: Outlets

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: DI

    func set(interactor: BookDetailsInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: BookDetailsRouterProtocol) {
        self.router = router
    }

    func set(imageLoader: ImageLoaderProtocol) {
        self.imageLoader = imageLoader
    }

    // MARK: Setup

    private func setupUI() {
    }

    // MARK: Display

    func setBook(with book: BookModel) {
    }
}
