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
        date = item.date.parseAPIString()
        //TODO: fix later
        time = MealTime(rawValue: item.haksikType) ?? .저녁
        location = Location(rawValue: item.haksikType) ?? .교직원
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
