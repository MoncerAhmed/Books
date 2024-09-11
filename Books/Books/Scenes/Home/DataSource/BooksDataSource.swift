//
//  BooksDataSource.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

class BooksDataSource: NSObject, UICollectionViewDataSource {

    // MARK: - Properties

    private var imageLoader: ImageLoaderProtocol?
    private weak var delegate: FavoritesDelegate?

    var books: [BookModel] = []
    private var isComingFromHome = false

    func set(books: [BookModel], isComingFromHome: Bool) {
        self.books = books
        self.isComingFromHome = isComingFromHome
    }

    func set(imageLoader: ImageLoaderProtocol?) {
        self.imageLoader = imageLoader
    }
    
    func set(delegate: FavoritesDelegate) {
        self.delegate = delegate
    }

    func item(at index: Int) -> BookModel {
        return books[index]
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.reuseIdentifier.bookCell,
            for: indexPath
        ) as BookCell? else { return .init() }

        if let url = URL(string: books[indexPath.row].coverURL) {
            imageLoader?.loadImage(url: url,
                                   into: cell.bookImageView,
                                   placeholder: nil,
                                   completion: nil)
            cell.configure(
                with: books[indexPath.row],
                isComingFromHome: isComingFromHome,
                delegate: delegate
            )
        }
        return cell
    }
}
