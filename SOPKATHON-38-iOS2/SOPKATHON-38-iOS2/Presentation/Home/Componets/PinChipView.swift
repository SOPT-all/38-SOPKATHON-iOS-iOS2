//
//  PinChipView.swift
//  SOPKATHON-38-iOS2
//
//  Created by Codex on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class PinChipView: UIView {
    
    let pinButton = UIButton()
    private let titleLabel: chipLabel
    
    init(text: String) {
        self.titleLabel = chipLabel(text: text)
        super.init(frame: .zero)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 119, height: 124)
    }
    
    func activate() {
        pinButton.setImage(UIImage(resource: .imgBang), for: .normal)
        pinButton.isEnabled = true
        titleLabel.backgroundColor = .main500
    }
    
    func pinFrame(in view: UIView) -> CGRect {
        return pinButton.convert(pinButton.bounds, to: view)
    }
    
    private func setUI() {
        addSubviews(titleLabel, pinButton)
    }
    
    private func setStyle() {
        pinButton.do {
            $0.setImage(UIImage(resource: .imgQuestion), for: .normal)
            $0.contentMode = .scaleAspectFit
            $0.isEnabled = false
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        
        pinButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.centerX.bottom.equalToSuperview()
            $0.size.equalTo(70)
        }
    }
}
