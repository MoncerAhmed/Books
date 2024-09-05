//
//  BooksDataSource.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

class BooksDataSource: NSObject, UICollectionViewDataSource {

    private var imageLoader: ImageLoaderProtocol?
    private var books: [BookModel] = []

    func set(books: [BookModel]) {
        self.books = books
    }

    func set(imageLoader: ImageLoaderProtocol?) {
        self.imageLoader = imageLoader
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

        if let url = URL(string: books[indexPath.row].imageURL.orEmptyString) {
            imageLoader?.loadImage(url: url,
                                   into: cell.bookImageView,
                                   placeholder: nil,
                                   completion: nil)
            cell.configure(with: books[indexPath.row])
        }
        return cell
    }
}
