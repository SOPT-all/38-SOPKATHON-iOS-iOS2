//
//  BaseResponseDTO.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import Foundation

struct BaseResponseDTO<T: Decodable> : Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: T?
}
