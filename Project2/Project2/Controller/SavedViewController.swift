//
//  SavedViewController.swift
//  Project2
//
//  Created by Habibur Rahman on 1/7/23.
//

import UIKit

class SavedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var foodItems = [Food]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Saved"
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let data = UserDefaults.standard.data(forKey: "foods") {
            do {
                let decoder = JSONDecoder()
                let foods = try decoder.decode([Food].self, from: data)
                self.foodItems = foods
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SavedCollectionViewCell
        cell.imageView.image = UIImage(named: "\(foodItems[indexPath.row].image)")
        cell.nameLabel.text = "\(foodItems[indexPath.row].itemName)"
        cell.locationButton.text = "\(foodItems[indexPath.row].location)"
        cell.ratingLabel.text = "(\(foodItems[indexPath.row].rating)k)"
        cell.favoriteButton.setImage(UIImage(systemName: foodItems[indexPath.row].isFavorite ? "heart.fill" : "heart"), for: .normal)
        cell.saveButton.setImage(UIImage(systemName: foodItems[indexPath.row].isSaved ? "bookmark.fill" : "bookmark"), for: .normal)
        cell.priceLabel.text = "$\(foodItems[indexPath.row].price)"
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    
}
