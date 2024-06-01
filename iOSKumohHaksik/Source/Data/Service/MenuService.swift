//
//  MenuService.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/28/24.
//

import Foundation

import Moya
import Combine
import CombineMoya

public class MenuService {
    private let provider = MoyaProvider<MenuTarget>()

    func fetchMenuList(meal: MealTime, location: Location,start: Date,end: Date) -> AnyPublisher<ResponseBody<[MenuItemDTO]>, MoyaError> {
        return provider.requestPublisher(.weekmenus(meal: meal, location: location, startDate: start, endDate: end))
            .filterSuccessfulStatusCodes()
            .map(ResponseBody<[MenuItemDTO]>.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func fetchMenu(meal: MealTime, location: Location,date: Date)  -> AnyPublisher<ResponseBody<MenuItemDTO>,MoyaError> {
        return provider.requestPublisher(.todaymenu(meal: meal, location: location, date: date))
            .filterSuccessfulStatusCodes()
            .map(ResponseBody<MenuItemDTO>.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
