//
//  Constant.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/30/24.
//

import Foundation


let moyaConstant = MoyaConstant()

struct MoyaConstant {
    
    let baseURL: String = "https://haksikfunc.azurewebsites.net"

}


//TODO: FIX Later 좋은 방법인 아닌거 같음
enum MealTime: String {
    case 아침 = "breakfast"
    case 점심 = "lunch"
    case 저녁 = "dinner"
    case error = "error"
}

enum Location: String {
    case 학식 = "haksik"
    case 교직원 = "pro"
    case 분식당 = "snack"
    case 오름1동 = "riseF"
    case 오름3동 = "riseS"
    case 푸름 = "poo"
    case error = "error"
}
