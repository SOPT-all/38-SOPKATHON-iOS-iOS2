//
//  SortButton.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

class SortButton: BaseView {
    
    var onSelect: ((Int) -> Void)?
    private var selectedIndex = 0
    
    private let popularButton = UIButton()
    private let latestButton = UIButton()
    
    private lazy var buttons = [popularButton, latestButton]
    
    private let sortStackView = UIStackView()
    
    private let selectedBackgroundColor: UIColor = .gray800
    private let normalTextColor: UIColor = .gray300
    private let selectedTextColor: UIColor = .gray100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAction()
        updateSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        sortStackView.addArrangedSubviews(popularButton, latestButton)
        addSubviews(sortStackView)
    }
    
    override func setLayout() {
        popularButton.snp.makeConstraints {
            $0.height.equalTo(27)
        }
        
        latestButton.snp.makeConstraints {
            $0.width.equalTo(popularButton)
            $0.height.equalTo(27)
        }
        
        sortStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(2)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    override func setStyle() {
        backgroundColor = .white
        layer.cornerRadius = 15.5
        clipsToBounds = true
        
        popularButton.do {
            $0.setTitle("인기순", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .caption_sb_12
            $0.layer.cornerRadius = 13
            $0.clipsToBounds = true
        }
        
        latestButton.do {
            $0.setTitle("최신순", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .caption_sb_12
            $0.layer.cornerRadius = 13
            $0.clipsToBounds = true
        }
        
        sortStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fillEqually
        }
    }
    
    private func setAction() {
        buttons.enumerated().forEach { index, button in
            button.tag = index
            button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        }
    }

    @objc private func buttonDidTap(_ sender: UIButton) {
        selectedIndex = sender.tag
        updateSelection()
        onSelect?(selectedIndex)
    }

    private func updateSelection() {
        buttons.enumerated().forEach { index, button in
            let isSelected = (index == selectedIndex)
            button.backgroundColor = isSelected ? selectedBackgroundColor : .clear
            button.setTitleColor(isSelected ? selectedTextColor : normalTextColor, for: .normal)
        }
    }
}
