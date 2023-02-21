//
//  SearchVC.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.returnKeyType = .done
            searchBar.enablesReturnKeyAutomatically = false
        }
    }
    
    let identifier = "NewCategoryCvCell"
    var items: [BookMarkModel] = []
    var allTitle = [String]()
    var searchData = [String]()
    var filtered:[String] = []
    var searchActive : Bool = false
    
    let arrayViewModel = ArrayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTitle()
        setupNewCvCell()
        searchBar.delegate = self
    }
    
    // MARK: - Buttons Action
    @IBAction func backButtonAction() {
        self.dismiss(animated: true)
        
    }
    
    // MARK: - Private Methods -
    
    func setupNewCvCell() {
        let nib = UINib(nibName: "NewCategoryCvCell", bundle: nil)
        searchCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
    }
    
    func getTitle() {
        for i in 0..<newCollections.count {
            allTitle.append(newCollections[i].title ?? String())
        }
        searchData = allTitle

    }
    
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! NewCategoryCvCell
        
        cell.title.text = searchData[indexPath.row]
//        cell.configure(data: items[indexPath.row])
        cell.bookMarkButton.addTarget(self, action: #selector(bookMarkButtonAction), for: .touchUpInside)
        return cell
    }
    
    @objc func bookMarkButtonAction(_ sender: UIButton) {
        if let bookMarkCell = sender.superview?.superview?.superview?.superview as? NewCategoryCvCell {
            guard let indexPath = searchCollectionView.indexPath(for: bookMarkCell) else { return }
            
            bookMarkCell.bookMarkButton.backgroundColor = UIColor.red
            arrayViewModel.saveData(data: items[indexPath.row])
            
        }
    }
    
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sz = self.view.frame.width - 20
        return CGSize(width: sz/2, height: sz/2)
    }
    
}


// MARK: - Search
extension SearchVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = searchText.isEmpty ? allTitle : allTitle.filter {
            (item: String) -> Bool in
            print("Search Title = ", item)
            return item.range(of: searchText, options: .caseInsensitive, range: nil) != nil
        }
        searchCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
}
