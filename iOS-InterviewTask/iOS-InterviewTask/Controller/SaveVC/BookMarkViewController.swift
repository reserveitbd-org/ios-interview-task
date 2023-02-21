//
//  BookMarkViewController.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

class BookMarkViewController: UIViewController {

    let identifier = "NewCategoryCvCell"
    @IBOutlet weak var newCategoryCollectionView: UICollectionView!
    let arrayViewModel = ArrayViewModel()
    
    var newCollections: [BookMark] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arrayViewModel.fetchData()
        newCollections = arrayViewModel.arr
        
        setupBannerCvCell()
        newCategoryCollectionView.reloadData()
    }
    
    // MARK: - Private Methods -
    
    func setupBannerCvCell() {
        let nib = UINib(nibName: "NewCategoryCvCell", bundle: nil)
        newCategoryCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        newCategoryCollectionView.delegate = self
        newCategoryCollectionView.dataSource = self
    }


}


extension BookMarkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newCollections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NewCategoryCvCell
        
        cell.title.text = newCollections[indexPath.row].title
    
        return cell
    }
    
//    @objc func bookMarkButtonAction(_ sender: UIButton) {
//        if let bookMarkCell = sender.superview?.superview?.superview as? NewCategoryCvCell {
//            guard let indexPath = newCategoryCollectionView.indexPath(for: bookMarkCell) else { return }
//            bookMarkCell.bookMarkButton.setImage(UIImage(named: "bx_bxs-star")!, for: .normal)
//            //bookMarkArry.append(newCollections[indexPath.row])
//            arrayViewModel.saveData(data: newCollections[indexPath.row])
//        }
//    }
    
}
