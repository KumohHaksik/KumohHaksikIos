//
//  WeeklyView.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/2/24.
//

import Foundation
import UIKit

protocol UIWeeklyViewDelegate {

  /// 선택한 날짜를 ㅁㄴㅇㅁ
  /// - Parameter date: 날짜.
  func dayTapped()

}

///
public class UIWeeklyView: UIView, UIWeeklyViewDelegate {
  private var date: Date

  public override init(frame: CGRect) {
      self.date = Date.now
    super.init(frame: frame)
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UI
extension UIWeeklyView {
  func container() -> UIView {
    let con = UIView()

    return con
  }
    
    func dayButton(week: String,status: WeeklyButtonState) -> UIButton {
        let btn = UIButton()
        
        btn.setTitle(week, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        //btn.addTarget(self, action: #selector(dayTapped), for: .touchUpInside)
        
        
        return btn
    }
}

// MARK: - Delegate
extension UIWeeklyView {
  public func dayTapped() {

  }
}


enum WeeklyButtonState {
    case selected
    case sunday
    case saturday
    case normaal
}
