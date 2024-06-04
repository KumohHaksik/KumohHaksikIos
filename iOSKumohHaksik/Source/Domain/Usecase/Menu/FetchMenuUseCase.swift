//
//  FetchMenuUseCase.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/2/24.
//
import Combine
import Foundation
import Moya

public struct FetchMenuUseCase {
    private let repository: MenuRepositoryProtocol
    
    init(repository: MenuRepositoryProtocol){
        self.repository = repository
    }
    
    func execute(meal: MealTime,location: Location,date: Date) async throws -> AnyPublisher<MenuItem,MoyaError> {
        return repository.fetchMenu(meal: meal, location: location, date: date)
    }
    
}
