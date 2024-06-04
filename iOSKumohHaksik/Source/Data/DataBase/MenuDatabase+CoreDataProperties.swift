//
//  MenuDatabase+CoreDataProperties.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/5/24.
//
//

import Foundation
import CoreData


extension MenuDatabase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MenuDatabase> {
        return NSFetchRequest<MenuDatabase>(entityName: "MenuDatabase")
    }

    @NSManaged public var menus: String?
    @NSManaged public var date: Date?
    @NSManaged public var location: String?
    @NSManaged public var time: String?

}

extension MenuDatabase : Identifiable {

}
