//
//  PostListResponseDTO.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import Foundation

struct PostListResponseDTO: Decodable {
    let stories: [PostDTO]
}

struct PostDTO: Decodable {
    let storyId: Int
    let spotName: String
    let title: String
    let preview: String
    let storyType: String
    let myReactionType: String?
    let commentCount: Int
}
