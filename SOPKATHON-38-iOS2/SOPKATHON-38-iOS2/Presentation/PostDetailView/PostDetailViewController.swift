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
    
    private let rootView = PostContentsView()
    private let bubbleMessageView = BubbleMessageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubviews(rootView, bubbleMessageView)
        navigationBar.configure (
            title: "전문 읽기",
            showBackButton: true
        )
    }
    
    private func setLayout() {
        rootView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(479)
        }
        
        bubbleMessageView.snp.makeConstraints {
            $0.top.equalTo(rootView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
