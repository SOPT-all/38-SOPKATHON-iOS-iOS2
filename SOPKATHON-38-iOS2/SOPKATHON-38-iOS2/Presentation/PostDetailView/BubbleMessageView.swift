//
//  BubbleMessageView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

//
//  BubbleMessageView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class BubbleMessageView: BaseView {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let stackView = UIStackView()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .white
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 9
            $0.alignment = .leading
        }
    }
    
    override func setUI() {
        
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(stackView)
        
        let messages = [
                    "그냥 사랑 싸움이더라.. ㅎㅎ",
                    "목소리가 커서 사람들 다 보는거 같아요",
                    "괜히 말 안 하고 있었음 ㅋㅋㅋㅋㅋ",
                    "나도 저런 시절이 있었지 ㅠㅠ 그립다",
                    "목소리가 커서 사람들 다 보는 거 같아요",
                    "괜히 말 안 하고 있었음 ㅋㅋㅋㅋㅋ",
                    "나도 저런 시절이 있었지 ㅠㅠ 그립다"
                ]
        
        messages.forEach {
            let bubbleView = BubbleMessageComponent(message: $0)
            
            stackView.addArrangedSubview(bubbleView)
            
            bubbleView.snp.makeConstraints {
                $0.height.equalTo(36)
            }
        }
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(24)
        }
    }
}
