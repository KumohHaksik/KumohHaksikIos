//
//  Utils.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/31/24.
//

import Foundation



private let formatter: DateFormatter = DateFormatter();


// MARK: - Date Extension
extension Date {
    
    
    public func toAPIString() -> String{
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
