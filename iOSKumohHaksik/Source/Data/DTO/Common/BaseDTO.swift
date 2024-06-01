//
//  BaseDTO.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/1/24.
//

import Foundation

struct ResponseBody<T: Codable>: Codable {
    let error: ErrorBody
    let data: T
}

struct ErrorBody: Codable {
    let message: String
}

