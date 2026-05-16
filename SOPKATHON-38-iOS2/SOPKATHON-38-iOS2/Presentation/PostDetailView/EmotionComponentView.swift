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
    
    // MARK: - UI Components
    
    private let containerView = UIView()
    
    private let emotions: [(emoji: String, count: Int)] = [
        ("🥰", 20),
        ("😊", 20),
        ("😐", 20),
        ("😮", 20),
        ("😰", 20)
    ]
    
    private var emotionButtons: [UIButton] = []
    private var countLabels: [UILabel] = []
    private var counts: [Int] = [20, 20, 20, 20, 20]
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .clear
        
        containerView.do {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            $0.layer.cornerRadius = 28
            $0.clipsToBounds = true
        }
    }
    
    override func setUI() {
        
        addSubview(containerView)
        
        var previousView: UIView?
        
        for (index, emotion) in emotions.enumerated() {
            
            let buttonContainer = UIStackView()
            buttonContainer.do {
                $0.axis = .vertical
                $0.alignment = .center
                $0.spacing = 4
            }
            
            let button = UIButton(type: .system)

            button.do {
                
                let attributedTitle = NSAttributedString(
                    string: emotion.emoji,
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
            let countLabel = UILabel()
            
            countLabel.do {
                $0.text = "\(emotion.count)"
                $0.textColor = .white
                $0.font = .systemFont(ofSize: 12, weight: .medium)
                $0.textAlignment = .center
            }
            
            emotionButtons.append(button)
            countLabels.append(countLabel)
            
            buttonContainer.addArrangedSubview(button)
            buttonContainer.addArrangedSubview(countLabel)
            
            containerView.addSubview(buttonContainer)
            
            button.snp.makeConstraints {
                $0.size.equalTo(38)
            }
            
            buttonContainer.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                
                if let previousView {
                    $0.leading.equalTo(previousView.snp.trailing).offset(12)
                } else {
                    $0.leading.equalToSuperview().inset(16)
                }
                
                if index == emotions.count - 1 {
                    $0.trailing.equalToSuperview().inset(16)
                }
            }
            
            previousView = buttonContainer
        }
    }
    
    override func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(267)
            $0.height.equalTo(74)
        }
    }
    
    // MARK: - Action
    
    @objc
    private func emotionButtonDidTap(_ sender: UIButton) {
        let index = sender.tag
        
        counts[index] += 1
        countLabels[index].text = "\(counts[index])"
    }
}
