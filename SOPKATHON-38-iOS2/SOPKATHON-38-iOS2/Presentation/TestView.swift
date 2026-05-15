//
//  TestView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

import SnapKit
import Then

final class TestView: BaseView {
    private let titleLabel = UILabel()
    
    override func setUI() {
        addSubviews(titleLabel)
    }
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "솝커톤 시작이야"
            $0.textColor = .gray100
            $0.font = .title_sb_24
        }
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(80)
            $0.centerX.equalToSuperview()
        }
    }
}
