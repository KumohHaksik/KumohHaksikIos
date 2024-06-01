//
//  fetchMenuListUseCase.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/29/24.
//
import Combine
import Foundation
import Moya


public struct FetchMenuListUseCase {
    private let repository: MenuRepositoryProtocol
    
    init(repository: MenuRepositoryProtocol){
        self.repository = repository
    }
    
    func execute(meal: MealTime,location: Location,start: Date,end: Date) async throws -> AnyPublisher<[MenuItem],MoyaError> {
        return repository.fetchMenuList(meal: meal, location: location, start: start, end: end)
    }
}
