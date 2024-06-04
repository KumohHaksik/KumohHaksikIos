//
//  MenuContext.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/5/24.
//

import Foundation
import UIKit
import CoreData

class MenuContext {
    let appDelegate: AppDelegate
    let context: NSManagedObjectContext

    init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func create(_ item: MenuItem) throws {
        let entity = MenuDatabase(context: context)
        
        entity.date = item.date
        entity.location = item.location.rawValue
        entity.time = item.time.rawValue
        entity.menus = item.menus.joined(separator: "^")
        
        context.insert(entity)
        try save()
    }
    
    func createRange(_ items: [MenuItem]) throws {
        let entity = items.map { item -> MenuDatabase in
            let entity = MenuDatabase(context: context)
            
            entity.date = item.date
            entity.location = item.location.rawValue
            entity.time = item.time.rawValue
            entity.menus = item.menus.joined(separator: "^")
            
            return entity
        }
        
        entity.forEach { item in
            logger.deubug(item.id)
            context.insert(item)
        }
        try save()
    }
    
    
    func save() throws {
        do {
            try context.save()
        } catch {
            logger.error("Error saving context: \(error)")
        }
    }
    
    func show() {
        
    }
    
    
}
	
class MenuDatabaseFetch: NSFetchRequest<NSFetchRequestResult> {
    override init() {
        super.init()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
