//
//  BaseViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

import SnapKit

class BaseViewController: UIViewController {
    
    let navigationBar = TopNavigationBar()
    
    var contentRootView: UIView? {
        return nil
    }
    
    var shouldShowNavigationBar: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 호출 - \(type(of: self))")
        
        baseSetUI()
        configureNavigationBar()
        baseSetLayout()

        setAddTarget()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        print("viewWillAppear 호출 - \(type(of: self))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear 호출 - \(type(of: self))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear 호출 - \(type(of: self))")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear 호출 - \(type(of: self))")
    }
    
    private func baseSetUI() {
        if let contentRootView {
            view.addSubview(contentRootView)
        }
        
        if shouldShowNavigationBar {
            view.addSubview(navigationBar)
        }
    }
    
    private func baseSetLayout() {
        if shouldShowNavigationBar {
            navigationBar.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(statusBarHeight + 60)
            }
        }
        
        if let contentRootView {
            contentRootView.snp.makeConstraints {
                if shouldShowNavigationBar {
                    $0.top.equalTo(navigationBar.snp.bottom)
                } else {
                    $0.top.equalToSuperview()
                }
                
                $0.horizontalEdges.bottom.equalToSuperview()
            }
        }
    }
    
    func configureNavigationBar() {}

    func setAddTarget() {}

    func setDelegate() {}
}
