//
//  MenuItem.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/28/24.
//

import Foundation

struct MenuItemDTO: Codable {
    let id: String
    let mealType: String
    let haksikType: String
    let date: Date
    let menus: String
}
