//
//  NewCollectionViewCell.swift
//  Project2
//
//  Created by Habibur Rahman on 1/7/23.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    
    
    var isFavorite = false
    var isSaved = false
    var totalRating = 0
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingNumber: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        isFavorite = !isFavorite
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        isSaved = !isSaved
        if isSaved {
            saveButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            
        } else {
            saveButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
}
