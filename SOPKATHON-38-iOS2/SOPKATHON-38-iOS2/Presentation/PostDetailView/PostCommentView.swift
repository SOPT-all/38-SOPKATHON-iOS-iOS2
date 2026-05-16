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
    
    private let commentField = UITextField()
    private let sendButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(commentField, sendButton)
    }
    
    override func setLayout() {
        commentField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(11)
            $0.leading.equalToSuperview().inset(17)
            $0.width.equalTo(290)
            $0.height.equalTo(38)
        }
        
        sendButton.snp.makeConstraints {
            $0.centerY.equalTo(commentField)
            $0.trailing.equalToSuperview().inset(22)
            $0.size.equalTo(40)
        }
    }
    
    override func setStyle() {
        commentField.do {
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 19
            $0.clipsToBounds = true
            $0.textColor = .gray400
            $0.font = .caption_m_12
            $0.placeholder = "의견을 남겨주세요"
            $0.addLeftPadding(30)
        }
        
        sendButton.do {
            $0.setImage(UIImage(resource: .sendBtn), for: .normal)
        }
    }
}
