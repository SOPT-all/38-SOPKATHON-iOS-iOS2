//
//  PostContentsView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

class PostSubContentsView: BaseView {
    
    // MARK: - UI Components

    private let titleStackView = UIStackView()
    private let titleLabel = UILabel()
    private let timeStackView = UIStackView()
    private let locationImageView = UIImageView()
    private let locationLabel = UILabel()
    private let timeImageView = UIImageView()
    private let timeLabel = UILabel()
    private let contentLabel = UILabel()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        titleStackView.do {
            $0.axis = .vertical
            $0.spacing = 7
            $0.alignment = .leading
        }
        
        titleLabel.do {
            $0.font = .title_sb_24
            $0.textColor = .white
            $0.text = "블라블라블"
        }
        
        timeStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .leading
        }
        
        locationImageView.do {
            $0.image = .locationFilled
        }
        
        locationLabel.do {
            $0.font = .caption_m_12
            $0.textColor = .white
            $0.text = "라인프렌즈"
        }
        
        timeImageView.do {
            $0.image = .ionTime
        }
        
        timeLabel.do {
            $0.font = .caption_m_12
            $0.textColor = .white
            $0.text = "11:00"
        }
        
        contentLabel.do {
            $0.font = .body_m_14
            $0.textColor = .white
            $0.numberOfLines = 0
            $0.text = """
            라인프렌즈에서 사소한 말다툼으로 잠깐 분위기가 싸해졌었다
            서로 서운해하면서 괜히 말 안 하고 있었는데, 결국 웃긴 인형 보다가 둘 다 터져서 화해함
            지금 생각하면 그냥 귀여운 사랑싸움이었다.
            """
        }
    }
    
    override func setUI() {
        addSubviews(titleStackView, timeStackView, contentLabel)
        
        titleStackView.addArrangedSubviews(titleLabel, timeStackView)
        
        timeStackView.addArrangedSubviews(locationImageView, locationLabel, timeImageView, timeLabel)
    }
    
    override func setLayout() {
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        locationImageView.snp.makeConstraints {
            $0.width.height.equalTo(12)
        }
        
        timeImageView.snp.makeConstraints {
            $0.width.height.equalTo(12)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
}
