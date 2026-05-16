//
//  PostListViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by Codex on 5/17/26.
//

import UIKit

final class PostListViewController: UIViewController {
    
    private let postListView = PostListView()
    
    override func loadView() {
        view = postListView
    }
}
