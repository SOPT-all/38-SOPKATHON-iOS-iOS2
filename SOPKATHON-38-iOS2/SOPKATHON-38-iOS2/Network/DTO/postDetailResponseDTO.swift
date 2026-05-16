//
//  postDetailResponseDTO.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import Foundation

struct postDetailResponseDTO: Decodable {
    let storyId: Int
    let spotName: String
    let userId: Int
    let nickname: String
    let title: String
    let content: String
    let storyType: String
    let reactionCounts: [String: Int]
    let myReactionType: String
    let commentCount: Int
    let createdAt: String
}
