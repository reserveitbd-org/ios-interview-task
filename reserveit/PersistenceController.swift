//
//  PersistenceController.swift
//  reserveit
//
//  Created by Md. Abdul Mozid on 11/1/23.
//

import CoreData
import Foundation

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example collections
        for i in 0..<10 {
            let collection = NewCollection(context: controller.container.viewContext)
            collection.title = "Race car \(i)"
            collection.rating = 3.5
            collection.noOfReview = "4k+"
            collection.isBookmarked = false
            collection.location = "Dhanmondi"
            collection.price = 345.0
        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "NewCollectionDataModel")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
}
