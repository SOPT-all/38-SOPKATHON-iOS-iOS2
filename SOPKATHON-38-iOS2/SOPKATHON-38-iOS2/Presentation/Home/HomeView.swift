//
//  HomeView.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    private let mapView = UIImageView()
    private let avatarImage = UIImageView()
    private let pinChipView = PinChipView(text: "커플개싸움")
    private let locationButton = UIButton()
    private let pinChipView1 = PinChipView(text: "커플개싸움")
    private let pinChipView2 = PinChipView(text: "커플개싸움")
    private let pinChipView3 = PinChipView(text: "커플개싸움")

    
    var pinButton: UIButton {
        return pinChipView.pinButton
    }
    
    override func setUI() {
        addSubviews(mapView,
                    avatarImage,
                    pinChipView,
                    pinChipView1,
                    pinChipView2,
                    pinChipView3,
                    locationButton
        )
    }
    
    override func setStyle() {
        mapView.do {
            $0.image = UIImage(resource: .imgMap)
            $0.contentMode = .scaleAspectFill
        }
        
        avatarImage.do {
            $0.image = UIImage(resource: .imgPingotop)
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
        }
        
        locationButton.do {
            $0.setImage(UIImage(resource: .locationFAB), for: .normal)
            $0.contentMode = .scaleAspectFit
        }
        
        configureAvatarPanGesture()
    }
    
    override func setLayout() {
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        avatarImage.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        pinChipView.snp.makeConstraints {
            $0.centerX.equalTo(avatarImage.snp.leading).offset(-23.5)
            $0.top.equalTo(avatarImage.snp.bottom).offset(52)
        }
        
        locationButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(32)
        }
        
        pinChipView1.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(319)
            $0.top.equalToSuperview().inset(31)
        }
        
        pinChipView2.snp.makeConstraints {
            $0.trailing.equalTo(pinChipView.snp.trailing).offset(-71)
            $0.top.equalTo(pinChipView.snp.bottom).offset(38)
        }
        
        pinChipView3.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(319)
            $0.top.equalToSuperview().inset(31)
        }
    }
    
    private func configureAvatarPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleAvatarPan(_:)))
        avatarImage.addGestureRecognizer(panGesture)
    }
    
    @objc private func handleAvatarPan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        avatarImage.transform = avatarImage.transform.translatedBy(
            x: translation.x,
            y: translation.y
        )
        gesture.setTranslation(.zero, in: self)
        updatePinImageIfNeeded()
    }
    
    private func updatePinImageIfNeeded() {
        let avatarFrame = avatarImage.convert(avatarImage.bounds, to: self)
        let pinFrame = pinChipView.pinFrame(in: self)
        
        if avatarFrame.intersects(pinFrame) {
            pinChipView.activate()
        }
    }
}
