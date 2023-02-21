//
//  NewCollectionTvCell.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

var bookMarkArry: [BookMarkModel] = []
var newCollections: [BookMarkModel] = []

class NewCollectionTvCell: UITableViewCell {

    let identifier = "NewCategoryCvCell"
    @IBOutlet weak var newCategoryCollectionView: UICollectionView!
    let arrayViewModel = ArrayViewModel()
    
    let data = UIImage(named: "newCollections")?.jpegData(compressionQuality: 1.0)

    override func awakeFromNib() {
        super.awakeFromNib()
                
        loadData()
        setupNewCvCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private Methods -
    
    func setupNewCvCell() {
        let nib = UINib(nibName: "NewCategoryCvCell", bundle: nil)
        newCategoryCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        newCategoryCollectionView.delegate = self
        newCategoryCollectionView.dataSource = self
    }
    
    func loadData() {
        newCollections = [
            BookMarkModel(image: data, title: "Race Car", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Maruti Suzuki", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Hyundai", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Mahindra", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Horse Race Car", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Mahindra", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Racing Car", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),
            BookMarkModel(image: data, title: "Racing2 Car", location: "Dhanmondi 27", price: "$345", rating: 3.5, order: "(4k +)", isBookMark: false),

        ]
    }
    
}

extension NewCollectionTvCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newCollections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NewCategoryCvCell
        
        cell.configure(data: newCollections[indexPath.row])
        cell.bookMarkButton.addTarget(self, action: #selector(bookMarkButtonAction), for: .touchUpInside)
        return cell
    }
    
    @objc func bookMarkButtonAction(_ sender: UIButton) {
        if let bookMarkCell = sender.superview?.superview?.superview?.superview as? NewCategoryCvCell {
            guard let indexPath = newCategoryCollectionView.indexPath(for: bookMarkCell) else { return }
            
            bookMarkCell.bookMarkButton.backgroundColor = UIColor.red
            arrayViewModel.saveData(data: newCollections[indexPath.row])
            
        }
    }
    
}
