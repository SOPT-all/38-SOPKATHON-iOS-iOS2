//
//  HomeViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

class HomeViewController: BaseViewController {
    private let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    override func setAddTarget() {
        homeView.pinButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    func buttonDidTap() {
        print("느낌표 버튼 탭")
    }
}
