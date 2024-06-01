//
//  ResBody.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/28/24.
//

import Foundation

protocol ResBodyProtocol {
    
}

struct ResBody<T> {
    let error: Error?
    let data: T?
}

struct Error {
    var message: String
}
