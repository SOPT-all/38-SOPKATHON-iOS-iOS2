//
//  UIFont+.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

// MARK: - 폰트 이름 상수화

extension UIFont {
    enum Pretendard: String {
        case semiBold = "Pretendard-SemiBold"
        case medium = "Pretendard-Medium"
    }
        
    static func pretendard(weight: Pretendard, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    // MARK: - Title
    static let title_sb_24 = UIFont.pretendard(weight: .semiBold, size: 24)
    static let title_m_24 = UIFont.pretendard(weight: .medium, size: 24)
    static let title_sb_20 = UIFont.pretendard(weight: .semiBold, size: 20)
    static let title_m_22 = UIFont.pretendard(weight: .medium, size: 22)
        
    // MARK: - Body
    static let body_sb_18 = UIFont.pretendard(weight: .semiBold, size: 18)
    static let body_m_18 = UIFont.pretendard(weight: .medium, size: 18)
    static let body_sb_16 = UIFont.pretendard(weight: .semiBold, size: 16)
    static let body_m_16 = UIFont.pretendard(weight: .medium, size: 16)
    static let body_sb_14 = UIFont.pretendard(weight: .semiBold, size: 14)
    static let body_m_14 = UIFont.pretendard(weight: .medium, size: 14)
        
    // MARK: - Caption
    static let caption_sb_12 = UIFont.pretendard(weight: .semiBold, size: 12)
    static let caption_m_12 = UIFont.pretendard(weight: .medium, size: 12)
}
