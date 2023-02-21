//
//  ViewController.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 20/2/23.
//

import UIKit

class ViewController: UIViewController {

    let bannerIdentifier = "bannerCvCell"
    let tableViewCellIdentifier1 = "cell"
    let tableViewCellIdentifier2 = "cell1"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bannerCollectioinView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var categoryTableView: UITableView!
    let head = ["Category", "New Collection"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        searchBar.delegate = self
        setupBannerCvCell()
        setupTableView()
        timeToScroll()
    }

    var timer = Timer()
    var counter = 0
    
    func timeToScroll() {
        pageController.numberOfPages = 10
        pageController.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeImage() {
        
        if counter < 8 {
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollectioinView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageController.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollectioinView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageController.currentPage = counter
            counter = 1
        }
    }
    
    // MARK: - Private Methods -
    
    func setupUI() {
        let HEADER_HEIGHT = 100
        categoryTableView.tableHeaderView?.frame.size = CGSize(width: categoryTableView.frame.width, height: CGFloat(HEADER_HEIGHT))
    }
    
    func setupBannerCvCell() {
        let nib = UINib(nibName: "BannerCvCell", bundle: nil)
        bannerCollectioinView.register(nib, forCellWithReuseIdentifier: bannerIdentifier)
        bannerCollectioinView.delegate = self
        bannerCollectioinView.dataSource = self
    }
    
    func setupTableView() {
        let nib1 = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        categoryTableView.register(nib1, forCellReuseIdentifier: tableViewCellIdentifier1)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        let nib2 = UINib(nibName: "NewCollectionTvCell", bundle: nil)
        categoryTableView.register(nib2, forCellReuseIdentifier: tableViewCellIdentifier2)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        categoryTableView.separatorColor = .none
    }
    
    // MARK: - Button Action -
    
    @objc func gotoSearchBar() {
        
        
    }

}

// MARK: - Collection view delegate and data source extension -

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectioinView.dequeueReusableCell(withReuseIdentifier: bannerIdentifier, for: indexPath) as! BannerCvCell
        return cell
    }
    
}


// MARK: - TableView view delegate and data source -

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return head.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("SectionHeaderTvCell", owner: self, options: nil)?.first as! SectionHeaderTvCell
        header.headerTitle.text = head[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return head[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier1, for: indexPath) as! CategoryTableViewCell
            return cell
        }else{
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier2, for: indexPath) as! NewCollectionTvCell            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else {
            return 215
        }
    }
    
}


extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let stroyboard = UIStoryboard(name: "Search", bundle: nil)
        let vc = stroyboard.instantiateViewController(withIdentifier: "SearchID")
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
        return false
    }
}
