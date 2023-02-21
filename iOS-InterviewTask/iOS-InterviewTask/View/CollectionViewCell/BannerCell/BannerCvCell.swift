//
//  BannerCvCell.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

class BannerCvCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 15
    }

}
