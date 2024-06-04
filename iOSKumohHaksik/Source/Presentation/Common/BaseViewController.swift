//
//  BaseViewController.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/3/24.
//

import Foundation
import UIKit

class BaseViewController<LayoutView: UIView>: UIViewController {
    var layoutView = LayoutView()
    
    override func loadView() {
        view = layoutView
    }
}
