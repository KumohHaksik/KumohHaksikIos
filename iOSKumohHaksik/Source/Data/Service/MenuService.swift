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
    #if DEBUG
    private let provider = MoyaProvider<MenuTarget>(plugins: [NetworkLoggerPlugin()])
    #else
    private let provider = MoyaProvider<MenuTarget>(plugins: [])
    #endif

    func fetchMenuList(meal: MealTime, location: Location,start: Date,end: Date) -> AnyPublisher<ResponseBody<[MenuItemDTO]>, MoyaError> {
        return provider.requestPublisher(.weekmenus(meal: meal, location: location, startDate: start, endDate: end))
            .filterSuccessfulStatusCodes()
        #if DEBUG
            .handleEvents(receiveOutput: { response in
                if let responseString = String(data: response.data, encoding: .utf8) {
                    logger.info("Response Data: \(responseString)")
                } else {
                    logger.warn("Response Data: (Invalid UTF-8 Data)")
                }
            })
            .tryMap { response -> ResponseBody<[MenuItemDTO]> in
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(ResponseBody<[MenuItemDTO]>.self, from: response.data)
                    return decodedResponse
                } catch {
                    logger.error("Decoding error: \(error)")
                    throw error
                }
            }
            .mapError { error -> MoyaError in
                if let moyaError = error as? MoyaError {
                    return moyaError
                } else {
                    return MoyaError.underlying(error, nil)
                }
            }        
        #else
            .map(ResponseBody<[MenuItemDTO]>.self)
        #endif
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
