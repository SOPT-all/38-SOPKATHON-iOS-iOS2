//
//  EndPoint.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import Foundation

enum EndPoint {
    case testPost
    case test(Int)
    case parameterExample
    case getList(userId: Int, sort: String = "latest")
    case getStoryDetail(storyId: Int, userId: Int)
    
    var requestType: HTTPMethodType {
        switch self {
        case .testPost:
            return .post
            
        case .test,
             .parameterExample,
             .getStoryDetail:
            return .get
        case .getList:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .testPost:
            return "/api/v1/"
            
        case .test(let id):
            return "/api/v1/test/\(id)/"
            
        case .parameterExample:
            return "/api/v1/test?name=kim"
        case .getList(let userId, let sort):
            return "/api/v1/spots/stories?userId=\(userId)&sort=\(sort)"

            
        case .getStoryDetail(let storyId, let userId):
            return "/api/v1/stories/\(storyId)?userId=\(userId)"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .testPost, .test, .getList:
            HeaderType.basic.value
        case .parameterExample, .getStoryDetail:
            HeaderType.auth.value
        }
    }
}
