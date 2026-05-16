//
//  chipLabel.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

final class chipLabel: UILabel {
    
    private let textInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        setStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 119, height: 40)
    }
    
    private func setStyle() {
        font = .body_m_16
        textColor = .white
        backgroundColor = .gray400
        textAlignment = .center
        layer.cornerRadius = 20
        clipsToBounds = true
    }
}
