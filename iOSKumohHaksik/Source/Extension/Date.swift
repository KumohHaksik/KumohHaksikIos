//
//  Date.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/2/24.
//

import Foundation

private let formatter: DateFormatter = DateFormatter();


extension Date {
    public func toAPIString() -> String{
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    public func mondayOfWeek() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        return calendar.date(from: components)!
    }
}
extension String {
    public func parseAPIString() -> Date {
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)!
    }
}
