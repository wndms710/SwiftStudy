//
//  DraggableView.swift
//  PanGestureApp
//
//  Created by 조주은 on 2022/09/17.
//

import Foundation
import UIKit

class DraggableView: UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    // 인터페이스 빌더에서(xib) 만들어 질 때 이 코드가 실행됨
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            print("began")
            
        case .changed:
            let delta = pan.translation(in: self.superview)
            var myPosition = self.center
            
            if dragType == .x {
                myPosition.x += delta.x
            }
            else if dragType == .y {
                myPosition.y += delta.y
            }
            else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }

            self.center = myPosition
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        case .ended, .cancelled:
            print("ended cancelled")
            // 왼쪽 끝
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            // 오른쪽 끝
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
            
        default:
            break
        }
    }
    
}
