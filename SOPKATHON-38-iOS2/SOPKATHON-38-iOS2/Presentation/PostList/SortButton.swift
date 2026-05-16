//
//  SortButton.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

class SortButton: UIButton {
    
    private let sortTitleLabel = UILabel()
    private let sortIcon = UIImageView()
    
    private let sortStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        sortStackView.addArrangedSubviews(sortTitleLabel, sortIcon)
        addSubviews(sortStackView)
    }
    
    private func setLayout() {
        sortIcon.snp.makeConstraints {
            $0.width.equalTo(9.5)
            $0.height.equalTo(4.5)
        }
        
        sortStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setStyle() {
        backgroundColor = .white
        layer.cornerRadius = 15.5
        clipsToBounds = true
        
        sortIcon.do {
            $0.image = UIImage(systemName: "chevron.down")
            $0.tintColor = .black
        }
        
        sortTitleLabel.do {
            $0.text = "인기순"
            $0.textColor = .black
            $0.font = .body_sb_14
        }
        
        sortStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6.75
            $0.alignment = .center
            $0.isUserInteractionEnabled = false
        }
    }
}
