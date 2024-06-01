//
//  fetchMenuListUseCase.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/29/24.
//

import Foundation

public struct FetchMenuListUseCase {
    private let repository: MenuRepositoryProtocol
    
    init(repository: MenuRepositoryProtocol){
        self.repository = repository
    }
    
    public func execute() async throws -> Void {
    }
}
