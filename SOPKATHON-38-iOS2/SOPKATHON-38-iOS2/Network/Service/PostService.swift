//
//  PostService.swift
//  SOPKATHON-38-iOS2
//
//  Created by h2e on 5/17/26.
//

import Foundation

protocol PostService {
    func getPost(userId: Int) async throws -> PostListResponseDTO
}

final class DefaultPostService: PostService {
    let network = NetworkService.shared

    func getPost(userId: Int) async throws -> PostListResponseDTO {
        let response: PostListResponseDTO = try await network.request(endPoint: .getList(userId: userId))
        return response
    }
}
