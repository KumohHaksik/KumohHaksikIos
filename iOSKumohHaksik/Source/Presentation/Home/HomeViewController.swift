//
//  HomeController.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Combine
import Foundation
import UIKit

protocol HomeViewControllerDelegate: AnyObject {

}

final class HomeViewController: BaseViewController<HomeView> {
  private var cancellables: Set<AnyCancellable> = []

  weak var coordinator: HomeCoordinator?
  weak var delegate: HomeViewControllerDelegate?

  private let viewModel: HomeViewModel

  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel

    super.init(nibName: nil, bundle: nil)
    bind()

    layoutView.fetchButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    layoutView.settingButton.addTarget(
      self, action: #selector(settingButtonTapped), for: .touchUpInside)
    layoutView.testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }

}

//MARK: - Event
extension HomeViewController {
  @objc func buttonTapped() {
    logger.deubug("clicked button")
    Task {
      await viewModel.action(.fetchMenu)
    }
  }
  @objc
  func settingButtonTapped() {
    logger.deubug("clicked meal button")
    Task {
      await viewModel.action(.selectMeal)
    }
  }

  @objc
  func testButtonTapped() {
    logger.deubug("clicked location button")
    Task {
      await viewModel.action(.selectLocation)
    }
  }
}

//MARK: - Binding
extension HomeViewController {
  func bind() {
    bindMenu()
    bindLabel()
  }

  func bindMenu() {
    viewModel.$todayMenu
      .sink { menu in
        logger.deubug("menuList: \(menu?.menus.joined(separator: ", ") ?? "없음")")
        self.layoutView.menuLayout.clearSubView()
        menu?.menus.forEach({
          let label = UILabel()
          label.text = $0
          label.textColor = .systemOrange

          self.layoutView.menuLayout.addArrangedSubview(label)
        })
      }
      .store(in: &cancellables)
  }

  func bindLabel() {
    viewModel.$_meal
      .sink { [weak self] meal in
        guard let self = self else { return }

          logger.deubug("selelct meal: \(meal?.rawValue ?? "none")")
        DispatchQueue.main.async {
          self.layoutView.mealTimeLabel.text = meal?.rawValue
        }
      }

      .store(in: &cancellables)

    viewModel.$_location
      .sink { [weak self] location in
        guard let self = self else { return }
          logger.deubug("selelct location: \(location?.rawValue  ?? "none")")
        DispatchQueue.main.async {

          self.layoutView.locationLabel.text = location?.rawValue
        }
      }
      .store(in: &cancellables)
  }
}
