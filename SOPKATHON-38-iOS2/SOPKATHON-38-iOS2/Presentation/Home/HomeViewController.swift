//
//  HomeViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

class HomeViewController: BaseViewController {
    private let homeView = HomeView()
    
    override var contentRootView: UIView? {
        return homeView
    }
    
    override var shouldShowNavigationBar: Bool {
        return true
    }
    
    override func configureNavigationBar() {
        navigationBar.configure (
            title: "성수동 카페거리",
            showBackButton: false,
        )
    }
    
    override func setAddTarget() {
        homeView.pinButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    func buttonDidTap() {
        let postListViewController = PostListViewController()
        postListViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = postListViewController.sheetPresentationController {
            sheet.detents = [
                .custom(identifier: .init("postList")) { _ in
                    return 344
                }
            ]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        present(postListViewController, animated: true)
    }
}
