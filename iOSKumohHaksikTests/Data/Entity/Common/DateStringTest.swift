//
//  DateStringTest.swift
//  iOSKumohHaksikTests
//
//  Created by 신효성 on 5/30/24.
//

import Foundation
import XCTest
import iOSKumohHaksik

class DateTest: XCTestCase {
    func testDateString(){
        let tDate: Date = Date.now
        
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        
        
            
        XCTAssertEqual(tDate.toAPIString(),dateformat.string(from: Date.now))
    }
}
