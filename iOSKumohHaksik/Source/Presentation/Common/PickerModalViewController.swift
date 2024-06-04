//
//  PickerModalViewController.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/3/24.
//

import Foundation
import UIKit

class PickerModalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  var pickerView = UIPickerView()
  var pickerData: [[String]] = []

  var selectedMealTime: MealTime?
  var selectedLocation: Location?

  var onSelection: ((MealTime?, Location?) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.layer.cornerRadius = 10

    pickerView.dataSource = self
    pickerView.delegate = self

    view.addSubview(pickerView)

    pickerView.snp.makeConstraints({
        $0.leading.trailing.top.bottom.equalToSuperview()
        $0.height.equalTo(200)
    })

    pickerData = [
      MealTime.allCases.map { $0.rawValue },
      Location.allCases.map { $0.rawValue },
    ]
  }

    
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return pickerData.count
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData[component].count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
  {
    return pickerData[component][row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if component == 0 {
      selectedMealTime = MealTime(rawValue: pickerData[component][row])
    } else {
      selectedLocation = Location(rawValue: pickerData[component][row])
    }
    onSelection?(selectedMealTime, selectedLocation)
  }

}
