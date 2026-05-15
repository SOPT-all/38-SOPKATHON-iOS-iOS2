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
    
    var requestType: HTTPMethodType {
        switch self {
        case .testPost:
            return .post
        case .test, .parameterExample:
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

        }
    }
    
    var header: [String: String] {
        switch self {
        case .testPost, .test:
            HeaderType.basic.value
        case .parameterExample:
            HeaderType.auth.value
        }
    }
}
