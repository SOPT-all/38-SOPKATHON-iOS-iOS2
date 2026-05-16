//
//  StoryDetailService.swift
//  SOPKATHON-38-iOS2
//
//  Created by 김세령 on 5/17/26.
//

import Foundation

protocol StoryDetailService {
    func getStoryDetail(storyId: Int) async throws -> StoryDetailResponseDTO
}

final class DefaultStoryDetailService: StoryDetailService {
    
    private let network = NetworkService.shared
    
    func getStoryDetail(storyId: Int) async throws -> StoryDetailResponseDTO {
        do {
            let response: StoryDetailResponseDTO = try await network.request(
                endPoint: .getStoryDetail(storyId)
            )
            //TO-DO endPoint에 추가 필요
            
            return response
            
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}

final class MockStoryDetailService: StoryDetailService {
    
    func getStoryDetail(storyId: Int) async throws -> StoryDetailResponseDTO {
        
        return StoryDetailResponseDTO(
            success: true,
            status: nil,
            code: "SUCCESS_200",
            message: "요청이 성공했습니다.",
            data: StoryDetailData(
                storyId: 1,
                spotName: "한강공원",
                userId: 1,
                nickname: "익명 1",
                title: "한강밤",
                content: "스토리 본문입니다.",
                storyType: "MEMORY",
                reactionCounts: ReactionCounts(
                    LIKE: 12,
                    EMPATHY: 3,
                    SURPRISE: 0,
                    SAD: 1
                ),
                myReactionType: "LIKE",
                commentCount: 3,
                createdAt: "2026-05-17T12:00:00Z"
            )
        )
    }
}
