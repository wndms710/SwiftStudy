//
//  RotateButton.swift
//  CustomButtonApp
//
//  Created by 조주은 on 2022/09/25.
//

import UIKit

enum RotateType {
    case up
    case down
}

class MyButton {
    // 반드시 호출해야 하는 init
    convenience init(){
        self.init(frame: CGRect.zero)
    }
    
    init(frame: CGRect) {
        
    }
    
    required init(coder: NSCoder) {
        
    }
}

class CustomButton: MyButton {
    init() {
//        super.init()
        super.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class RotateButton: UIButton {
    
//    init() {
//        super.init(frame: .zero)        // init frame 알아보기
//    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        self.configure()
    }
    
    var isUp = RotateType.down {
        didSet {
            changeDesign()
        }
    }
    
    var selectTypeCallback: ((RotateType) -> Void)?
    
    private func configure() {
        self.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    @objc private func selectButton() {
        if isUp == .up {
            isUp = .down
        } else {
            isUp = .up
        }
        
        selectTypeCallback?(isUp)
    }

    
    private func changeDesign() {
        
        UIView.animate(withDuration: 0.25) {
            if self.isUp == .up {
                self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)
            } else {
                self.imageView?.transform = .identity   // 원래 상태로 돌아가기
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            }
        }

    }

}
