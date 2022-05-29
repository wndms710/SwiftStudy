//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by 조주은 on 2022/05/29.
//

import UIKit

class MyIDViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!{
        // false 3
        didSet{
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 처음 nextButton 상태 false 1, 2
//        nextButton.isEnabled = false
//        textFieldDidChanged(sender: emailTextField)

        emailTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)    // editingChanged : 글자가 계속 입력되거나 삭제될 때(changed)
        
    }
    
    // #selector로 가져오려면 @objc 붙여야함
    @objc func textFieldDidChanged(sender: UITextField) {
        
        if sender.text?.isEmpty == true {
            // 활성화 상태
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    


}
