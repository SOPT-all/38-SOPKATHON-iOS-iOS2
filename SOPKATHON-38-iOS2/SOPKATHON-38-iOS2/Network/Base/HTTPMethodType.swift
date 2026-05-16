//
//  HTTPMethodType.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import Foundation

import Foundation

enum HTTPMethodType {
    case get
    case post

    var key: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        }
    }
}

enum HeaderType {
    case auth
    case basic

    var value: [String: String] {
        switch self {
        case .auth:
            [
                "Content-Type": "application/json",
                "userId": "1"
            ]
        case .basic:
            ["Content-Type": "application/json"]
        }
    }
}
