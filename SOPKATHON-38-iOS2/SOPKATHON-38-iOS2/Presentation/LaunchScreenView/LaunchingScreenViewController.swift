//
//  LaunchingScreenViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by Codex on 5/17/26.
//

import UIKit

final class LaunchingScreenViewController: UIViewController {
    
    private let launchingScreenView = LaunchingScreenView()
    
    override func loadView() {
        view = launchingScreenView
    }
}
