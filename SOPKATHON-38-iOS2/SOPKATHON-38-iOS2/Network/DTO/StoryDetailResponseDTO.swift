//
//  StoryDetailResponseDTO.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import Foundation

struct StoryDetailResponseDTO: Decodable {
    let success: Bool
    let status: Int?
    let code: String
    let message: String
    let data: StoryDetailData?
}

struct StoryDetailData: Decodable {
    let storyId: Int
    let spotName: String
    let userId: Int
    let nickname: String
    let title: String
    let content: String
    let storyType: String
    let reactionCounts: ReactionCounts
    let myReactionType: String?
    let commentCount: Int
    let createdAt: String
}

struct ReactionCounts: Decodable {
    let LIKE: Int
    let EMPATHY: Int
    let SURPRISE: Int
    let SAD: Int
}
