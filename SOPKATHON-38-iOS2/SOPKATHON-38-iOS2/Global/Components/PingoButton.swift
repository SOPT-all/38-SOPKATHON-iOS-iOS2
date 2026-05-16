//
//  PingoButton.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

class PingoButton: UIButton {
    private let buttonColor: UIColor
    private let titleColor: UIColor
    private let title: String
    
    init(buttonColor: UIColor, titleColor: UIColor, title: String) {
        self.buttonColor = buttonColor
        self.titleColor = titleColor
        self.title = title
        super.init(frame: .zero)

        self.setTitle(title, for: .normal)
        self.backgroundColor = buttonColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
