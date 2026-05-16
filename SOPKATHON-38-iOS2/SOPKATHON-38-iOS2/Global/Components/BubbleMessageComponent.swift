//
//  BubbleMessageView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class BubbleMessageComponent: BaseView {
    
    // MARK: - UI Components
    
    private let messageLabel = UILabel()
    
    // MARK: - Initializer
    
    init(message: String) {
        super.init(frame: .zero)
        
        configure(message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .gray200
        
        layer.cornerRadius = 10
        layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMaxXMaxYCorner
        ]
        
        clipsToBounds = true
        
        messageLabel.do {
            $0.font = .caption_m_12
            $0.textColor = .gray600
            $0.numberOfLines = 0
        }
    }
    
    override func setUI() {
        addSubview(messageLabel)
    }
    
    override func setLayout() {
        
        messageLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(
                UIEdgeInsets(
                    top: 6,
                    left: 34,
                    bottom: 6,
                    right: 34
                )
            )
        }
    }
    
    // MARK: - Public Method
    
    func configure(message: String) {
        messageLabel.text = message
    }
}
