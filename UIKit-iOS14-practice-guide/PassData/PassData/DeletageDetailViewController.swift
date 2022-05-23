//
//  DeletageDetailViewController.swift
//  PassData
//
//  Created by 조주은 on 2022/05/23.
//

import UIKit

protocol DeletageDetailViewControllerDelegate: AnyObject {      // weak로 받기 위해서는 AnyObject 타입 준수
    // 밑의 함수는 데이터를 넘겨주는 것을 대신하는 기능
    func passString(string: String)
}

class DeletageDetailViewController: UIViewController {
    // 구현되는 쪽에서 사용하고 끝나면 없어지게 만들어 놓아야함 (weak)
    weak var delegate: DeletageDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // delegate쪽 위임해서 func에 값을 넣음, 구현부는 mainVC에
    @IBAction func passDataToMainVC(_ sender: Any) {
        // 이 함수가 instance가 없어도 접근할 수 있는 대리자를 만듬
        delegate?.passString(string: "delegate pass Data")
        self.dismiss(animated: true, completion: nil)
    }
    
}
