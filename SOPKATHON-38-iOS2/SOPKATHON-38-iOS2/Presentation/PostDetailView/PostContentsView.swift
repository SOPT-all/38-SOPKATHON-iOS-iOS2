//
//  PostContentsView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class PostContentsView: BaseView {
    
    // MARK: - UI Components
    
    private let postSubContentsView = PostSubContentsView()
    private let backgroundImageView = UIImageView()
    private let emotionComponentView = EmotionComponentView()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .main700
        roundBottomCorners(radius: 8)
        clipsToBounds = true
        
        backgroundImageView.do {
            $0.image = UIImage(named: "piggu_heart")
        }
    }
    
    override func setUI() {
        addSubviews(backgroundImageView,
                    postSubContentsView,
                    emotionComponentView)
    }
    
    override func setLayout() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        postSubContentsView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.horizontalEdges.equalToSuperview().inset(5)
        }
        
        emotionComponentView.snp.makeConstraints {
            $0.top.equalTo(postSubContentsView.snp.bottom).offset(216)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(267)
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview().inset(28)
        }
    }
}
