//
//  UIStackVIewExtension.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/4/24.
//

import Foundation
import UIKit

extension UIStackView {
  func clearSubView() {

    self.arrangedSubviews.forEach({ x in
        x.removeFromSuperview()
    })
  }

}
