//
//  PostListViewController.swift
//  SOPKATHON-38-iOS2
//
//  Created by Codex on 5/17/26.
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
}
