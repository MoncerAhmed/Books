//
//  BookCell.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

protocol FavoritesDelegate: AnyObject {
    func favoritesButtonTapped()
}

class BookCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var readsLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    private weak var delegate: FavoritesDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow()
    }

    func configure(with book: BookModel, isComingFromHome: Bool) {
        favoritesButton.isHidden = isComingFromHome
        bookTitleLabel.text = book.title
        bookAuthorLabel.text = book.author
        readsLabel.text = book.reads + " reads"
        reviewsLabel.text = book.reviews + " reviews"
    }

    @IBAction func favoritesButtonTapped(_ sender: Any) {
        delegate?.favoritesButtonTapped()
    }
}
