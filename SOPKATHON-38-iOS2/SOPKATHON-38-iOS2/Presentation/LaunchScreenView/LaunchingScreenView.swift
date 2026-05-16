//
//  LaunchingScreenView.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class LaunchingScreenView: BaseView {
    private let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubview(logoImageView)
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    override func setStyle() {
        backgroundColor = .black
        logoImageView.do {
            $0.image = UIImage(resource: .imgLogo)
        }
    }
}
