//
//  PostDetailViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit

final class PostDetailViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let rootView = PostContentView()
    
    override var contentRootView: UIView? {
        return rootView
    }
    
    override var shouldShowNavigationBar: Bool {
        return true
    }
    
    // MARK: - Custom Methods

    override func configureNavigationBar() {
        navigationBar.configure (
            title: "전문 읽기",
            showBackButton: false,
            backgroundColor: .gray300
        )
    }
}
