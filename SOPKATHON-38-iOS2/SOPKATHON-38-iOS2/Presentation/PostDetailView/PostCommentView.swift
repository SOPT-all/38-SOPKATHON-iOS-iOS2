//
//  PostCommentView.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class PostCommentView: BaseView {
    
    // MARK: - UI Components
    
    private let commentStackView = UIStackView()
    private let commentField = UITextField()
    private let sendButton = UIButton()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        
        backgroundColor = .white
        
        commentStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .center
        }
        
        commentField.do {
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 19
            $0.clipsToBounds = true
            $0.textColor = .gray400
            $0.font = .caption_m_12
            $0.placeholder = "의견을 남겨주세요"
            $0.addLeftPadding(16)
        }
        
        sendButton.do {
            $0.setImage(UIImage(resource: .sendBtn), for: .normal)
        }
    }
    
    override func setUI() {
        
        addSubview(commentStackView)
        
        commentStackView.addArrangedSubviews(
            commentField,
            sendButton
        )
    }
    
    override func setLayout() {
        
        commentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        commentField.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        sendButton.snp.makeConstraints {
            $0.size.equalTo(40)
        }
    }
}
