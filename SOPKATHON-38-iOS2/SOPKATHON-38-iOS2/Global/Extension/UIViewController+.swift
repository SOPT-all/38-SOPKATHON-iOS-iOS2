//
//  UIViewController+.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

extension UIViewController {
    
    var statusBarHeight: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        return windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }

    /// 키보드 위 화면 터치 시, 키보드 내리기
    func hideKeyboardWhenTappedAround() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapped.cancelsTouchesInView = false
        view.addGestureRecognizer(tapped)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
