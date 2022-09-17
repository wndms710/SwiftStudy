//
//  DraggableView.swift
//  PanGestureApp
//
//  Created by 조주은 on 2022/09/17.
//

import Foundation
import UIKit

class DraggableView: UIView {
    
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
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
            
            myPosition.x += delta.x
            myPosition.y += delta.y
            
            self.center = myPosition
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        case .ended, .cancelled:
            print("ended cancelled")
            
        default:
            break
        }
    }
    
}
