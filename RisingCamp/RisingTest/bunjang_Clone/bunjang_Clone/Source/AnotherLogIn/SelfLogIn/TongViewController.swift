//
//  TongViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/21.
//

import UIKit

protocol TongViewControllerDelegate {
    func sendTag(_ tag: Int)
}

class TongViewController: UIViewController {
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6 {
            if i == myTag {
                let img = self.view.viewWithTag(i) as! UIImageView
                img.isHighlighted = true
            }
            else {
                let img = self.view.viewWithTag(i) as! UIImageView
                img.isHighlighted = false
            }
        }
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.sendTag(self.myTag)
    }
    
    
    //MARK: - properties
    var wherePhone: String?
    var myTag: Int = 0
    var delegate: TongViewControllerDelegate?
    
    
    //MARK: - 선택되었을 때
    @IBAction func didSelected(_ sender: UIButton) {
        
        for i in 1...6 {
            if i == sender.tag {
                let img = self.view.viewWithTag(i) as! UIImageView
                img.isHighlighted = true
            }
            else {
                let img = self.view.viewWithTag(i) as! UIImageView
                img.isHighlighted = false
            }
        }
        
        self.myTag = sender.tag
//        print(myTag)
        
        self.dismiss(animated: true)
    }
    
    
}
