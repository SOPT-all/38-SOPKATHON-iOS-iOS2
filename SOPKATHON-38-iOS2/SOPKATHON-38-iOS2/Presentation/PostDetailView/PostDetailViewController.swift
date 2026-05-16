//
//  PostDetailViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class PostDetailViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let rootView = PostContentsView()
    private let bubbleMessageView = BubbleMessageView()
    private let grayLineView = UIView()
    private let commentBoxView = UIView()
    private let postCommentView = PostCommentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - Custom Methods
    
    private func setStyle() {
        
        view.backgroundColor = .white
        
        grayLineView.do {
            $0.backgroundColor = .gray200
        }
        
        commentBoxView.do {
            $0.backgroundColor = .white
            
            $0.layer.shadowColor = UIColor.white.cgColor
            $0.layer.shadowOpacity = 0.7
            $0.layer.shadowRadius = 12
            $0.layer.shadowOffset = CGSize(width: 0, height: -42)

        }
    }
    
    private func setUI() {
        
        view.addSubviews(
            rootView,
            bubbleMessageView,
            grayLineView,
            commentBoxView
        )
        
        commentBoxView.addSubview(postCommentView)
        
        navigationBar.configure(
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
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(commentBoxView.snp.top)
        }
        
        grayLineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(commentBoxView.snp.top)
            $0.height.equalTo(1)
        }
        
        commentBoxView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(84)
        }
        
        postCommentView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
    }
}
