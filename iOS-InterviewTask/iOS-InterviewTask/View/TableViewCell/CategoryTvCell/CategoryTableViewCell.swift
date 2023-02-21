//
//  CategoryTableViewCell.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    let identifier = "categoryCell"

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBannerCvCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupBannerCvCell() {
        let nib = UINib(nibName: "CategoryCvCell", bundle: nil)
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CategoryCvCell
        return cell
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
