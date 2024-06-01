//
//  HomeView.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation
import UIKit

import SnapKit
import Then
import FSCalendar
public class HomeView : UIView {
    private let calendar = FSCalendar()


    public required init?(coder: NSCoder) {
        fatalError("no implements")
    }
    func commonInit(){
        let view = UIView()
        view.backgroundColor = .systemBackground

        view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        self.addSubview(view)        
        
    }
}

//MARKUP - component
extension HomeView {
    func comp(){
        
    }
}
