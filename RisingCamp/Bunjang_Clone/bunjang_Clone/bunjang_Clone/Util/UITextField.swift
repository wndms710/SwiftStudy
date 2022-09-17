//
//  UITextField.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/20.
//

import Foundation
import UIKit

extension UITextField {
    
    //키보드 한국어 먼저 띄우기
    private func getKeyboardLanguage() -> String? {
        return "ko-KR"
    }
    
    open override var textInputMode: UITextInputMode? {
        if let language = getKeyboardLanguage() {
            for inputMode in UITextInputMode.activeInputModes {
                if inputMode.primaryLanguage! == language {
                    return inputMode
                }
            }
        }
        return super.textInputMode
    }
}
