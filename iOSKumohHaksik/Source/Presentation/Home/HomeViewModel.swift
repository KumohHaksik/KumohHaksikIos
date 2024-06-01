//
//  HomeViewModel.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation



final class HomeViewModel {
    @Published private(set) var menuListState: MenuListState = .none
    @Published private(set) var today: Date
    var menus = [].publisher
    private(set) var fetchMenuListUseCase: FetchMenuListUseCase
    init(fetchMenuListUseCase: FetchMenuListUseCase) {
        self.fetchMenuListUseCase = fetchMenuListUseCase
        today = Date.now
    }
    
    func action(_ action: HomeViewModelAction) async {
        switch action {
        case .fetchMenu:
            fetchMenu()
        case .refreshMenuList:
            refreshMenuList()
        case .reqeustMenuList:
            await fetchMenuList()
        }
    }
    
}
//MARK: fetch,reqeust
extension HomeViewModel {
    func fetchMenu() {
    }

    func fetchMenuList() async {
        
        let calendar = Calendar.current

        let date1 = calendar.date(from: DateComponents(year: 2024, month: 5, day: 27))!
        let date2 = calendar.date(from: DateComponents(year: 2024, month: 5, day: 31))!

        Task {
        
        }
    }

    func refreshMenuList() {
    }
}
