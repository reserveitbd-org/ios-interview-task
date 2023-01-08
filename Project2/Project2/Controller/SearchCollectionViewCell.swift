//
//  SearchCollectionViewCell.swift
//  Project2
//
//  Created by Habibur Rahman on 1/8/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    var isFavorite = false
    var isSaved = false
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var price: UILabel!
    
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
