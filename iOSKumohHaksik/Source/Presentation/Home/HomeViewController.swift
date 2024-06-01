//
//  HomeController.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation
import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    
}

final class HomeViewController: UIViewController {
    weak var coordinator: HomeCoordinator?
    weak var delegate: HomeViewControllerDelegate?
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
