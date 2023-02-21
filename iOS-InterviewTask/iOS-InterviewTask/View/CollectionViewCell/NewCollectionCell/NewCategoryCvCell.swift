//
//  NewCategoryCvCell.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

class NewCategoryCvCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var bookMarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(data: BookMarkModel){
        image.image = UIImage(data: data.image ?? Data())
        title.text = data.title
        location.text = data.location
        price.text = data.price
        rating.text = "\(data.rating ?? 1.0)"
        order.text = data.order
        
    }
    
    public func configure1(data: BookMark){
        image.image = UIImage(data: data.image ?? Data())
        title.text = data.title
        location.text = data.location
        price.text = data.price
        rating.text = "\(data.rating ?? 1.0)"
        order.text = data.order
        
    }

}
