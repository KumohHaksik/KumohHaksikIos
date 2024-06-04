//
//  MenuListRepository.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/30/24.
//

import Foundation
import Combine
import Moya

class MenuRepository: MenuRepositoryProtocol {
    
    let service: MenuService!
    init(service: MenuService){
        self.service = service
    }
    
    func fetchMenuList(meal: MealTime, location: Location, start: Date, end: Date) -> AnyPublisher<[MenuItem],MoyaError> {
        return service.fetchMenuList(meal: meal, location: location, start: start, end: end)
            .map { response in
                return response.data!.map({
                        return MenuItem($0)
                })
            }.eraseToAnyPublisher()
    }
    
    func fetchMenu(meal: MealTime, location: Location, date: Date) -> AnyPublisher<MenuItem,MoyaError> {
        return service.fetchMenu(meal: meal, location: location, date: date)
            .map { response in
                return MenuItem(response.data!)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchCoreDataMenu() {
    }
}
