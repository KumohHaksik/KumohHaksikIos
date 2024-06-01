//
//  HomeActionState.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/27/24.
//

import Foundation

enum HomeViewModelAction {
    case fetchMenu
    case reqeustMenuList
    case refreshMenuList
}


enum MenuListState {
    case none
    case loading
    case fininsh
    case error(message: String)
}
