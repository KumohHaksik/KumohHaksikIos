//
//  MenuItem.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/28/24.
//

import Foundation

public struct MenuItem {
    let time: MealTime
    let location: Location
    let menus: [String]
    let date: Date
    init(_ item: MenuItemDTO) {
        menus = item.menus.split(separator: "^").map(String.init)
        date = item.date
        //TODO: fix later
        time = MealTime(rawValue: item.haksikType) ?? .error
        location = Location(rawValue: item.haksikType) ?? .error
    }


}

//MARK: function
extension MenuItem {
    func toString() -> String {
        return date.toAPIString()
    }

    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

//MARK: private function
extension MenuItem {
    
}
