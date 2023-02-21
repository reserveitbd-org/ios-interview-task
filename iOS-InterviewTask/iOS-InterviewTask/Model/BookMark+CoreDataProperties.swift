//
//  BookMark+CoreDataProperties.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//
//

import Foundation
import CoreData


extension BookMark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookMark> {
        return NSFetchRequest<BookMark>(entityName: "BookMark")
    }

    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var location: String?
    @NSManaged public var price: String?
    @NSManaged public var rating: Double
    @NSManaged public var order: String?
    @NSManaged public var isBookMark: Bool

}

extension BookMark : Identifiable {

}
