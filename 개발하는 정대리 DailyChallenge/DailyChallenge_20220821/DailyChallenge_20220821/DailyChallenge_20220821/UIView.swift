//
//  UIView.swift
//  DailyChallenge_20220821
//
//  Created by 조주은 on 2022/09/28.
//

import UIKit

extension UIView {
    // 테두리 만들기
    func makeBorder(color: CGColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    
    // 테두리 둥글게
    func setViewCornerRadius(radius: CGFloat) {
        self.clipsToBounds = false
        self.layer.cornerRadius = radius
    }
}
