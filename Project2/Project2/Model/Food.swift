//
//  Food.swift
//  Project2
//
//  Created by Habibur Rahman on 1/8/23.
//

import Foundation
import UIKit

struct Food: Codable {
    var itemName: String
    var category: String
    var price: Double
    var location: String
    var isFavorite: Bool
    var isSaved: Bool
    var rating: Int
    var image: String
}


