//
//  MenuRepositoryProtocol.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/29/24.
//

import Combine
import Foundation
import Moya

protocol MenuRepositoryProtocol {
    func fetchMenu(meal: MealTime, location: Location,date: Date) ->  AnyPublisher<MenuItem,MoyaError>
    
    func fetchMenuList(meal: MealTime, location: Location, start: Date, end: Date) -> AnyPublisher<[MenuItem],MoyaError>
    
    func fetchCoreDataMenu() -> Void
}
