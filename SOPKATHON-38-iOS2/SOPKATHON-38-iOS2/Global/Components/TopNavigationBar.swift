//
//  TopNavigationBar.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class TopNavigationBar: BaseView {
    
    // MARK: - Property
    
    var backButtonAction: (() -> Void)?
    
    // MARK: - UI Components
    
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .white
        
        backButton.do {
            $0.setImage(.icChevronLeft, for: .normal)
            $0.tintColor = .black
            $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        }
        
        titleLabel.do {
            $0.font = .body_sb_18
            $0.textColor = .black
        }
    }
    
    override func setUI() {
        addSubviews(backButton, titleLabel)
    }
    
    override func setLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton)
        }
    }
    
    // MARK: - Public Method

    func configure(
        title: String,
        showBackButton: Bool = false,
        backgroundColor: UIColor = .white
    ) {
        titleLabel.text = title
        backButton.isHidden = !showBackButton
        self.backgroundColor = backgroundColor
    }
    
    // MARK: - Action
    
    @objc
    private func backButtonDidTap() {
        backButtonAction?()
    }
}
