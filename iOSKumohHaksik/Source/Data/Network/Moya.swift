//
//  Moya.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation
import UIKit

import Moya

enum MenuTarget{
    case weekmenus(meal: MealTime, location: Location,startDate: Date,endDate : Date) //이번 주 메뉴 조회
    case todaymenu(meal: MealTime, location: Location, date: Date) //오늘 메뉴 조회
}

extension MenuTarget: TargetType {
    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=utf-8"]
    }

    
    var baseURL: URL {
        return URL(string: moyaConstant.baseURL)!
    }
    
    var path: String {
        switch self {
            case .weekmenus:
                return "/api/menus"
            case .todaymenu:
                return "/api/menu"
        }
    }
    
    var method: Moya.Method {
        switch self {
           case .weekmenus,
                .todaymenu:
                return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .weekmenus(let meal,let location,let startDate,let endDate):
            return .requestParameters(parameters: ["meal": meal.rawValue,"type": location.rawValue,"start": startDate.toAPIString(),"end": endDate.toAPIString()], encoding: URLEncoding.queryString)
        case .todaymenu(let meal,let location,let date):
            return .requestParameters(parameters: ["meal": meal.rawValue, "type": location.rawValue,"date": date.toAPIString()], encoding: URLEncoding.queryString)
        }
    }

}
