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
    func displayEmptyFavorites()
}

class FavoritesViewController: UIViewController, FavoritesViewControllerProtocol {

    // MARK: Properties
    var interactor: FavoritesInteractorProtocol?
    var router: FavoritesRouterProtocol?
    private var imageLoader: ImageLoaderProtocol?

    var booksDataSource = BooksDataSource()

    // MARK: Outlets

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    @IBOutlet weak var noFavoritesView: UIView!
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.handleViewDidLoad()
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
        noFavoritesView.isHidden = true
        favoritesCollectionView.isHidden = false
        booksDataSource.set(books: favorites)
        favoritesCollectionView.reloadData()
    }

    func displayEmptyFavorites() {
        noFavoritesView.isHidden = false
        favoritesCollectionView.isHidden = true
    }
}

// MARK: Privates

private extension FavoritesViewController {
    func setUpUI() {
        favoritesCollectionView.register(
            .init(nibName: R.nib.bookCell.identifier,
                  bundle: nil),
            forCellWithReuseIdentifier: R.reuseIdentifier.bookCell.identifier
        )
        booksDataSource.set(imageLoader: imageLoader)
        favoritesCollectionView?.dataSource = booksDataSource
        favoritesCollectionView?.delegate = self
    }
}

// MARK: UICollectionViewDelegate

extension FavoritesViewController: UICollectionViewDelegate {}

// MARK: UICollectionViewDelegateFlowLayout

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.size.width
        let collectionViewHeight = collectionViewWidth * 0.7

        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    // Distance Between Item Cells
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        32
    }
}
