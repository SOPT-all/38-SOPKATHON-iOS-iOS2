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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        view.addSubview(rootView)
        navigationBar.configure (
            title: "전문 읽기",
            showBackButton: false,
            backgroundColor: .gray300
        )
    }
    
    private func setLayout() {
        rootView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
