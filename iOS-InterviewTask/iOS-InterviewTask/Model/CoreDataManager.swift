//
//  CoreDataManager.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import UIKit

struct BookMarkModel {
    let image: Data?
    let title: String?
    let location: String?
    let price: String?
    let rating: Double?
    let order: String?
    let isBookMark: Bool?
    
    init(image: Data? = nil, title: String?, location: String?, price: String?, rating: Double?, order: String?, isBookMark: Bool?) {
        self.image = image
        self.title = title
        self.location = location
        self.price = price
        self.rating = rating
        self.order = order
        self.isBookMark = isBookMark
    }
}

class ArrayViewModel {
    
    var arr = [BookMark]()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    func fetchData() {
        do {
            arr = try self.context.fetch(BookMark.fetchRequest())
        }
        catch { print("Error:-- ", error.localizedDescription)}
    }
    
    
    func saveData(data: BookMarkModel) {
        
        let array = BookMark(context: context)
        
        array.image = data.image
        array.title = data.title
        array.location = data.location
        array.price = data.price
        array.rating = data.rating ?? 0.0
        array.order = data.order
        array.isBookMark = data.isBookMark ?? false
    
        do {
            try self.context.save()
        }
        catch { print("Error:--- ", error.localizedDescription)}
    }
    
    
    // It's created by me Faysal
    func saveUpdate() {
        do {
            try self.context.save()
        }
        catch { print("Error:--- ", error.localizedDescription)}
    }

    
    
    func deleteData(index: Int) {
        context.delete(arr[index])
        
        do {
            try context.save()
        }
        catch { print("Error:---- ", error.localizedDescription)}
    }
    
    
}
