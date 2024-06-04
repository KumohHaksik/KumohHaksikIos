//
//  HomeView.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation
import SnapKit
import Then
import UIKit

public class HomeView: UIView {
  let todayDateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black

    return label
  }()

  let fetchButton: UIButton = {
    let button = UIButton()
    button.setTitle("가져오기", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.backgroundColor = .systemBackground

    return button
  }()

  let settingButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("시간대", for: .normal)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.backgroundColor = .systemBackground

    return btn
  }()

  let testButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("위치", for: .normal)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.backgroundColor = .systemBackground
    return btn
  }()

  let menuItemLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemOrange

    return label
  }()

  let menutitleLabel: UILabel = {
    let label = UILabel()
      label.textColor = .systemOrange
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.text = "오늘의 메뉴"
    return label
  }()

  let menuLayout: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fill
    stack.spacing = 10
    return stack
  }()

  let mealTimeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemOrange
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.text = "식사 시간"
    return label
  }()

  let locationLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemOrange
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.text = "위치"
    return label
  }()

  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
}

//MARK: - Navigation
extension HomeView {

}

// MARK: - setup
extension HomeView {
  func setupUI() {
    backgroundColor = .systemBackground
    fecthButtonSetup()
    settingButtonSetup()
    testButtonSetup()

    mealTimeLabelSetup()
    locationLabelSetup()
    menuTitleSetup()
    menuLayoutSetup()

  }

  func fecthButtonSetup() {
    addSubview(fetchButton)

    fetchButton.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(10)
      $0.leading.equalToSuperview().offset(10)
      $0.width.equalTo(100)
      $0.height.equalTo(50)
    }
  }

  func settingButtonSetup() {
    addSubview(settingButton)

    settingButton.snp.makeConstraints({
      $0.top.equalTo(safeAreaLayoutGuide).offset(10)
      $0.leading.equalTo(fetchButton.snp.trailing).offset(10)
      $0.width.equalTo(100)
      $0.height.equalTo(50)
    })
  }

  func testButtonSetup() {
    addSubview(testButton)

    testButton.snp.makeConstraints({
      $0.top.equalTo(safeAreaLayoutGuide).offset(10)
      $0.leading.equalTo(settingButton.snp.trailing).offset(10)
      $0.width.equalTo(100)
      $0.height.equalTo(50)
    })
  }

  func menuTitleSetup() {
    addSubview(menutitleLabel)

    menutitleLabel.snp.makeConstraints({
      $0.centerX.equalToSuperview()
      $0.top.equalTo(locationLabel.snp.bottom).offset(10)
    })
  }

  func menuItemLabelSetup() {
    addSubview(menuItemLabel)

    menuItemLabel.snp.makeConstraints({
      $0.top.equalTo(mealTimeLabel.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    })
  }
  func menuLayoutSetup() {
    addSubview(menuLayout)

    menuLayout.snp.makeConstraints({
      $0.top.equalTo(menutitleLabel.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    })
  }
  func mealTimeLabelSetup() {
    addSubview(mealTimeLabel)

    mealTimeLabel.snp.makeConstraints({
      $0.top.equalTo(fetchButton.snp.bottom).offset(10)
      $0.leading.equalToSuperview().offset(10)
    })
  }

  func locationLabelSetup() {
    addSubview(locationLabel)

    locationLabel.snp.makeConstraints({
      $0.top.equalTo(fetchButton.snp.bottom).offset(10)
      $0.leading.equalTo(mealTimeLabel.snp.trailing).offset(10)
    })
  }
}
