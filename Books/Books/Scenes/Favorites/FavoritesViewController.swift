//
//  FavoritesViewController.swift
//  Books
//
//  Created by Ahmed Moncer on 04/09/2024.
//

import UIKit

//sourcery: AutoMockable
protocol FavoritesViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: FavoritesInteractorProtocol)
    func set(router: FavoritesRouterProtocol)
    func set(imageLoader: ImageLoaderProtocol)
    func display(favorites: [BookModel])
}

class FavoritesViewController: UIViewController, FavoritesViewControllerProtocol {

    // MARK: Properties
    var interactor: FavoritesInteractorProtocol?
    var router: FavoritesRouterProtocol?
    private var imageLoader: ImageLoaderProtocol?

    // MARK: Outlets


    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        interactor?.handleViewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: DI

    func set(interactor: FavoritesInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: FavoritesRouterProtocol) {
        self.router = router
    }

    func set(imageLoader: ImageLoaderProtocol) {
        self.imageLoader = imageLoader
    }

    // MARK: Display Favorites

    func display(favorites: [BookModel]) {
        favorites.forEach {
            print("zou fav is: ", $0.id)
        }
    }
}

// MARK: Privates

private extension FavoritesViewController {
    func setUpUI() {
//        favoritesCollectionView.dataSource = dataSource
//        favoritesCollectionView.delegate = self
    }
}
