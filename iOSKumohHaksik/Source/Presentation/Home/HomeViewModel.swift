//
//  HomeViewModel.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
  private var cancellables: Set<AnyCancellable> = []

  @Published private(set) var menuListState: MenuListState = .none
  @Published var menuList: [MenuItem] = []
  @Published var todayMenu: MenuItem?
  //임시 변수
  @Published var _meal: MealTime?
  @Published var _location: Location?

  private(set) var fetchMenuListUseCase: FetchMenuListUseCase
  private(set) var fetchMenuUseCase: FetchMenuUseCase

    
    //임시 변수
    var m_i = 0;
    var l_i = 0;
    
    let MealEnums = MealTime.allCases
    let LocationEnums = Location.allCases
    
  init(
    fetchMenuListUseCase: FetchMenuListUseCase,
    fetchMenuUseCase: FetchMenuUseCase
  ) {
    self.fetchMenuListUseCase = fetchMenuListUseCase
    self.fetchMenuUseCase = fetchMenuUseCase
  }

  func action(_ action: HomeViewModelAction) async {
    switch action {
    case .fetchMenu:
      await fetchMenu()
    case .refreshMenuList:
      await refreshMenuList()
    case .fetchMenuList:
      await fetchMenuList()
    case .selectLocation:
      selectLocation()
    case .selectMeal:
      selectMeal()
    case .openSettingModal:
      break
    }
  }

}
//MARK: - function
extension HomeViewModel {
  private func fetchMenu() async {
    do {
      guard let meal = _meal else {
        logger.deubug("meal is nil")
        return
      }
      guard let location = _location else {
        logger.deubug("location is nil")
        return
      }
      let menu = try await fetchMenuUseCase.execute(meal: meal, location: location, date: Date.now)
      menu.sink(
        receiveCompletion: { completion in
          switch completion {
          case .finished:
            return
          case .failure(let failure):
            logger.error(failure.localizedDescription)
          }
        },
        receiveValue: { value in
            logger.deubug("vm",value.menus)
          self.todayMenu = value
        })
        .store(in: &cancellables)


    } catch {

    }
  }

  private func fetchMenuList() async {

    let calendar = Calendar.current

    let date1 = calendar.date(from: DateComponents(year: 2024, month: 5, day: 25))!
    let date2 = calendar.date(from: DateComponents(year: 2024, month: 5, day: 29))!

    Task {
      do {
        menuListState = .loading
        let menus = try await fetchMenuListUseCase.execute(
          meal: .점심, location: .학식, start: date1, end: date2)
        menus.sink(
          receiveCompletion: { completion in
            switch completion {
            case .finished:
              break
            case .failure(let error):
              logger.error(error.localizedDescription)
            }

          },
          receiveValue: { [weak self] value in
            value.forEach { item in
              logger.deubug(item.menus.joined(separator: ", "))
              self?.menuList.append(item)
            }
          }
        )
        .store(in: &cancellables)
        menuListState = .fininsh
      } catch {
        menuListState = .error(message: "error")
      }
    }
  }

  func refreshMenuList() async {
    await fetchMenuList()
  }
    
    
    
    
    func selectLocation() {
        l_i = (l_i + 1) % LocationEnums.count
        _location = LocationEnums[l_i]
    }
    
    func selectMeal() {
        m_i = (m_i + 1) % MealEnums.count
        _meal = MealEnums[m_i]
    }
}
