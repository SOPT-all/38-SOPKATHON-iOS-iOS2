//
//  AddPostViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import UIKit

final class AddPostViewController: BaseViewController {
    
    private let addPostView = AddPostView()
    
    override var contentRootView: UIView? {
        return addPostView
    }
    
    override var shouldShowNavigationBar: Bool {
        return true
    }
    
    override func configureNavigationBar() {
        navigationBar.configure(
            title: "썰 추가하기",
            showBackButton: true
        )
        
        navigationBar.backButtonAction = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    override func setAddTarget() {
        addPostView.addTargetToSubmitButton(self, action: #selector(submitButtonDidTap))
    }
    
    @objc
    private func submitButtonDidTap() {
        if let navigationController {
            navigationController.popToRootViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}
