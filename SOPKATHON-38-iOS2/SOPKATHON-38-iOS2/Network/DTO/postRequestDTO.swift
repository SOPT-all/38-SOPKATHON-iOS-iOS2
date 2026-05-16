//
//  postRequestDTO.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/17/26.
//

import Foundation

struct postRequestDTO: Decodable {
    let userId: Int
    let title: String
    let content: String
    let storyType: String
}
