//
//  UIView+.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func roundBottomCorners(radius: CGFloat) {
            layer.cornerRadius = radius
            layer.maskedCorners = [
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
            clipsToBounds = true
        }
}
