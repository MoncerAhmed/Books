//
//  BookCell.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

class BookCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow()
    }

    func configure(with book: BookModel) {
        bookTitleLabel.text = book.title
        bookAuthorLabel.text = book.author
    }
}
