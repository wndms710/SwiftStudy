//
//  MeLogInViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/19.
//

// 이름 잘못 설정함

import UIKit

class MeLogInViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapSelfBut(_ sender: UIButton) {
        print("tap but")
        let selfLogInVC = storyboard?.instantiateViewController(withIdentifier: "SelfLogInViewController") as! SelfLogInViewController
        selfLogInVC.modalPresentationStyle = .overCurrentContext
        
        guard let pvc = self.presentingViewController else { return }
        
        self.dismiss(animated: true) {
            pvc.present(selfLogInVC, animated: true, completion: nil)
        }

    }
    
    
}
