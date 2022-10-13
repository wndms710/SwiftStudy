//
//  CustomView.swift
//  storyboard-tutorial
//
//  Created by 조주은 on 2022/10/13.
//

import Foundation
import UIKit

// @ : 어노테이션

// 인터페이스 빌더에서 디자인으로 확인 가능하게끔
@IBDesignable
class CustomView: UIView {
    
    // 인스펙터 패널에서 사용될 수 있도록 설정
    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
//    yellowView.layer.masksToBounds = false
//    yellowView.layer.borderWidth = 10   // 가장자리 보더라인 두께
//    yellowView.layer.borderColor = UIColor.blue.cgColor
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var isCircle : Bool = false {
        didSet {
            if isSquare && isCircle
            {
                self.layer.cornerRadius = self.frame.width / 2
            }
        }
    }
    
    // fileprivate : 해당 파일(CustomView.swift) 안에서만 사용한다.
    
    /// 뷰 정사각형 여부
    /// - Returns: 여부
//    fileprivate func isSquare() -> Bool {
//        return self.frame.width == self.frame.height
//    }
    
    fileprivate var isSquare : Bool {
        get {
            return self.frame.width == self.frame.height
        }
    }
    
    @IBInspectable
    var hasShadow : Bool = false {
        didSet {
            if hasShadow
            {
                layer.applyShadow()
            }
        }
    }
    
}
