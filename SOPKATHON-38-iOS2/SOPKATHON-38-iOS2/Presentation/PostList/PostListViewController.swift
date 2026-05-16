//
//  PostListViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

final class PostListViewController: UIViewController {
    
    private let postListView = PostListView()
    
    override func loadView() {
        view = postListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postListView.addTargetToAddButton(self, action: #selector(addButtonDidTap))
        postListView.onCellSelect = { [weak self] _ in
            self?.showPostDetailViewController()
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
        
        guard let presentingViewController else {
            present(postDetailViewController, animated: true)
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
