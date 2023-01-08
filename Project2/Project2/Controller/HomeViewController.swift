//
//  ViewController.swift
//  Project2
//
//  Created by Habibur Rahman on 1/7/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //var defaults = UserDefaults.standard
    
    var currentIndex = 0
    var timer: Timer?
    var foods = [Food]()
    var categories = ["Bangla", "Beverage", "Chinese", "Korean", "FastFood", "Italian", "Pizza", "Sweet", "Vegetarian"]
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var newCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foods.append(Food(itemName: "Indian Food", category: "Indian", price: 12.5, location: "Dhanmondi", isFavorite: true, isSaved: true, rating: 2, image: "item1"))
        
        foods.append(Food(itemName: "Italian Food", category: "Indian", price: 10.5, location: "Bangshal", isFavorite: false, isSaved: false, rating: 2, image: "item2"))
        foods.append(Food(itemName: "Thai Food", category: "Thai", price: 16.0, location: "Baridhara", isFavorite: false, isSaved: false, rating: 1, image: "item3"))
        foods.append(Food(itemName: "Vegetarian Food", category: "Vevarage", price: 5.5, location: "Mirpur", isFavorite: false, isSaved: false, rating: 1, image: "item4"))
        foods.append(Food(itemName: "Doi Fuska", category: "Bangla", price: 7.0, location: "Cantonment", isFavorite: false, isSaved: false, rating: 4, image: "item5"))
        foods.append(Food(itemName: "Thai Food", category: "Chinese", price: 12.5, location: "Uttara", isFavorite: false, isSaved: false, rating: 6, image: "item6"))
        foods.append(Food(itemName: "Bangali Food", category: "Bangla", price: 18.5, location: "Banani", isFavorite: false, isSaved: false, rating: 7, image: "item7"))
        foods.append(Food(itemName: "Fast Food", category: "Fast Food", price: 50.5, location: "Gulshan", isFavorite: false, isSaved: true, rating: 1, image: "item8"))
       
       
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        newCollectionView.delegate = self
        newCollectionView.dataSource = self
        
        pageControl.numberOfPages = foods.count
        pageControl.currentPage = currentIndex
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(foods)
            UserDefaults.standard.set(data, forKey: "foods")
            
        } catch {
            print("Unable to Encode Array of foods (\(error))")
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Locations", style: .plain, target: self, action: #selector(showLocation))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.badge"), style: .done, target: self, action: #selector(showNotification))
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        
    }
    
    @objc func slideToNext() {
        if currentIndex < foods.count - 1 {
            currentIndex += 1
            
        } else {
            currentIndex = 0
            pageControl.currentPage = currentIndex
        }
        pageControl.currentPage = currentIndex
        self.bannerCollectionView.scrollToItem(at: IndexPath(item: self.currentIndex, section: 0), at: .right, animated: true)
    }
    
    @objc func showNotification() {
        
        let alert = UIAlertController(title: "Notification", message: "You have a notification", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
        
    }
    
    @objc func showLocation() {
        let alert = UIAlertController(title: "Location", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.bannerCollectionView {
            return foods.count
        } else if
            collectionView == self.categoryCollectionView {
            return categories.count
        } else if collectionView == self.newCollectionView {
            return foods.count
            }
            return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.bannerCollectionView {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerCollectionViewCell
            bannerCell.imageView.image = UIImage(named: "\(foods[indexPath.row].image)")
                return bannerCell
            
            } else if collectionView == self.categoryCollectionView {
                let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
                categoryCell.imageView.image = UIImage(named: categories[indexPath.row])
                categoryCell.nameLabel.text = "\(categories[indexPath.row])"
                categoryCell.sizeThatFits(CGSize(width: categoryCell.frame.width, height: categoryCell.frame.height))
                categoryCell.imageView.layer.masksToBounds = true
                categoryCell.imageView.layer.cornerRadius = 10
                return categoryCell
                
            } else  {
                let newCollectionCell = newCollectionView.dequeueReusableCell(withReuseIdentifier: "newCollectionCell", for: indexPath) as! NewCollectionViewCell
                
                newCollectionCell.imageView.image = UIImage(named: "\(foods[indexPath.row].image)")
                newCollectionCell.nameLabel.text = foods[indexPath.row].itemName
                newCollectionCell.locationLabel.text = "\(foods[indexPath.row].location)"
                newCollectionCell.priceLabel.text = "$\(foods[indexPath.row].price)"
                newCollectionCell.ratingNumber.text = "(\(foods[indexPath.row].rating)k)"
                newCollectionCell.saveButton.setImage(UIImage(systemName: foods[indexPath.row].isSaved ? "bookmark.fill" : "bookmark"), for: .normal)
                newCollectionCell.favoriteButton.setImage(UIImage(systemName: foods[indexPath.row].isFavorite ? "heart.fill" : "heart"), for: .normal)
                return newCollectionCell
            }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}

