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
    private let storyDetailService = DefaultStoryDetailService()
    
    private let rootView = UIView()
    private let postContentsView = PostContentsView()
    private let bubbleMessageView = BubbleMessageView()
    private let grayLineView = UIView()
    private let commentBoxView = UIView()
    private let postCommentView = PostCommentView()
    
    override var contentRootView: UIView? {
        return rootView
    }
    
    override var shouldShowNavigationBar: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        getPosts()
    }
    
    override func configureNavigationBar() {
        navigationBar.configure(
            title: "전문 읽기",
            showBackButton: true
        )
        
        navigationBar.backButtonAction = { [weak self] in
            guard let self else { return }
            
            if let navigationController {
                navigationController.popViewController(animated: true)
            } else {
                dismiss(animated: true)
            }
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        rootView.backgroundColor = .white
        
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
        rootView.addSubviews(
            postContentsView,
            bubbleMessageView,
            grayLineView,
            commentBoxView
        )
        
        commentBoxView.addSubview(postCommentView)
    }
    
    private func setLayout() {
        postContentsView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(479)
        }
        
        bubbleMessageView.snp.makeConstraints {
            $0.top.equalTo(postContentsView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(commentBoxView.snp.top)
        }
        
        grayLineView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(commentBoxView.snp.top)
            $0.height.equalTo(1)
        }
        
        commentBoxView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(84)
        }
        
        postCommentView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
    }
    
    private func getPosts() {
        Task {
            do {
                let response = try await storyDetailService.getStoryDetail(storyId: 1, userId: 1)
//                if let title = response.title, let content = response.content{
//                    await MainActor.run {
//                        self.postContentsView.postSubContentsView.configure(title: title, content: content)
//                    }
//                }
                await MainActor.run {
                    self.postContentsView.postSubContentsView.configure(title: response.title, content: response.content)
                }
            } catch {
                print("🔴 에러: \(error)")
            }
        }
    }
}
