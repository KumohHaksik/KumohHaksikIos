//
//  HomeCoordinator.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {

    

  public func start() -> UIViewController {
    let menuService = MenuService()
    let menuRepository = MenuRepository(service: menuService)

    let viewmodel = HomeViewModel(
      fetchMenuListUseCase: FetchMenuListUseCase(repository: menuRepository),
      fetchMenuUseCase: FetchMenuUseCase(repository: menuRepository))

    return HomeViewController(viewModel: viewmodel)
  }

  func openSettingModal() {

  }
}	
