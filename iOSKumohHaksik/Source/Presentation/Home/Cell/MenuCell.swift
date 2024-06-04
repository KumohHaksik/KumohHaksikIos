//
//  MenuCell.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 6/2/24.
//

import Foundation
import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(menuImageView)
        menuImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
}
