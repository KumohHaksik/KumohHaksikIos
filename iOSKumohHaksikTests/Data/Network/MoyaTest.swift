//
//  MoyaTest.swift
//  iOSKumohHaksikTests
//
//  Created by 신효성 on 5/30/24.
//

import Foundation


import XCTest
import Moya
import Combine
import CombineMoya
import Then
@testable import iOSKumohHaksik

class MoyaProviderTest: XCTestCase {
    var provider: MoyaProvider<MenuTarget>!

    
    func testMenu(){
        provider = MoyaProvider<MenuTarget>(plugins: [NetworkLoggerPlugin()])

        let calendar = Calendar.current

        let date = calendar.date(from: DateComponents(year: 2024, month: 5, day: 27))!
        
        provider.request(.todaymenu(meal: .아침, location: .학식, date: date)) { result in
            switch result {
            case  .success(let response):
                do {
                    print(response)
                    let res = try JSONDecoder().decode(MenuItemDTO.self, from: response.data)
                    XCTAssertEqual(res.menus,"08:20~09:20^쌀밥^부대찌개^한입돈가스^콩나물무침^맛김구이^맛김치^알로에음료")
                }
                catch {
                    print("Decoding error: \(error)")
                    XCTFail("Decoding failed")
                }
                XCTFail("failed")

                break
            case .failure(let error):
                print("Request failed: \(error)")
                XCTFail("Request failed")
            }
        }
    }
    
}
	
