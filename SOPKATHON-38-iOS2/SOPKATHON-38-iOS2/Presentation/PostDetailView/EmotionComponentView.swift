//
//  EmotionComponent.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class EmotionComponentView: BaseView {
    
    var emotionButtonTapAction: ((Int) -> Void)?
    
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let emotionStackView = UIStackView()
    
    private let emotions: [String] = [
        "🥰",
        "😊",
        "😐",
        "😮",
        "😰"
    ]
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .clear
        
        containerView.do {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            $0.layer.cornerRadius = 28
            $0.clipsToBounds = true
        }
        
        emotionStackView.do {
            $0.axis = .horizontal
            $0.spacing = 12
            $0.alignment = .center
        }
    }
    
    override func setUI() {
        
        addSubview(containerView)
        
        containerView.addSubview(emotionStackView)
        
        for (index, emotion) in emotions.enumerated() {
            
            let button = UIButton(type: .system)

            button.do {
                
                let attributedTitle = NSAttributedString(
                    string: emotion,
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 22)
                    ]
                )
                
                $0.setAttributedTitle(attributedTitle, for: .normal)
                
                $0.backgroundColor = UIColor.black.withAlphaComponent(0.15)
                $0.layer.cornerRadius = 19
                $0.clipsToBounds = true
                $0.tag = index
                
                $0.addTarget(
                    self,
                    action: #selector(emotionButtonDidTap(_:)),
                    for: .touchUpInside
                )
            }
            
            emotionStackView.addArrangedSubview(button)
            
            button.snp.makeConstraints {
                $0.size.equalTo(38)
            }
        }
    }
    
    override func setLayout() {
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(267)
            $0.height.equalTo(74)
        }
        
        emotionStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Action
    
    @objc
    private func emotionButtonDidTap(_ sender: UIButton) {
        
        sender.backgroundColor = .main500.withAlphaComponent(0.7)
        
        emotionButtonTapAction?(sender.tag)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        }
    }
}
