//
//  EmotionComponent.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class EmotionComponent: BaseView {
    
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
        containerView.do {
            $0.backgroundColor = .lightGray
            $0.layer.cornerRadius = 28
        }
    }
    
    override func setUI() {
        addSubview(containerView)
        
        for (index, emotion) in emotions.enumerated() {
            
            let buttonContainer = UIStackView()
            buttonContainer.axis = .vertical
            buttonContainer.alignment = .center
            buttonContainer.spacing = 4
            
            let button = UIButton()
            button.do {
                $0.setTitle(emotion.emoji, for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 24)
                $0.backgroundColor = .gray
                $0.layer.cornerRadius = 19
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
                $0.top.bottom.equalToSuperview().inset(14)
                
                if index == 0 {
                    $0.leading.equalToSuperview().inset(16)
                } else {
                    $0.leading.equalTo(
                        emotionButtons[index - 1].superview!.snp.trailing
                    ).offset(12)
                }
                
                if index == emotions.count - 1 {
                    $0.trailing.equalToSuperview().inset(16)
                }
            }
        }
    }
    
    override func setLayout() {
        containerView.snp.makeConstraints {
            $0.width.equalTo(267)
            $0.edges.equalToSuperview()
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
