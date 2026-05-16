//
//  PostListViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

final class PostListViewController: UIViewController {
    
    private let postListView = PostListView()
    private let postService: PostService = DefaultPostService()
    private var stories: [PostDTO] = []
    
    override func loadView() {
        view = postListView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
        
        postListView.addTargetToAddButton(self, action: #selector(addButtonDidTap))
        postListView.onCellSelect = { [weak self] _ in
            self?.showPostDetailViewController()
        }
    }
    
    private func getPosts() {
        Task {
            do {
                let response = try await postService.getPost(userId: 1)
                await MainActor.run {
                    self.stories = response.stories
                    self.postListView.configure(stories: self.stories)
                }
            } catch {
                print("🔴 에러: \(error)")
            }
        }
    }
    
    @objc
    private func addButtonDidTap() {
        let addPostViewController = AddPostViewController()
        addPostViewController.modalPresentationStyle = .fullScreen
        
        presentAfterDismiss(addPostViewController)
    }
    private func showPostDetailViewController() {
        let postDetailViewController = PostDetailViewController()
    
        
//            present(postDetailViewController, animated: true)
        guard let presentingViewController else {
            return
        }
        
        dismiss(animated: true) {
            if let navigationController = presentingViewController.navigationController {
                navigationController.pushViewController(postDetailViewController, animated: true)
            } else {
                postDetailViewController.modalPresentationStyle = .fullScreen
                presentingViewController.present(postDetailViewController, animated: true)
            }
        }
    }
    
    private func presentAfterDismiss(_ viewController: UIViewController) {
        guard let presentingViewController else {
            present(viewController, animated: true)
            return
        }
        
        dismiss(animated: true) {
            presentingViewController.present(viewController, animated: true)
        }
    }
}
