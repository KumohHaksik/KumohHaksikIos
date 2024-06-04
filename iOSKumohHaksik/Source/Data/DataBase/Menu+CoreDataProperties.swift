//
//  Menu+CoreDataProperties.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/5/24.
//
//

import Foundation
import CoreData


extension Menu {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Menu> {
        return NSFetchRequest<Menu>(entityName: "Menu")
    }

    @NSManaged public var menus: String?
    @NSManaged public var date: Date?

}

extension Menu : Identifiable {

}
