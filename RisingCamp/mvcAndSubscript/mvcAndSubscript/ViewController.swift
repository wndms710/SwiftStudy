//
//  ViewController.swift
//  mvcAndSubscript
//
//  Created by 조주은 on 2022/06/16.
//

import UIKit


//struct User {
//    var name: String
//    var phoneNumber: String
//}

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBAction func sendData(_ sender: Any) {
        // 버튼을 눌렀을 때 취할 액션을 코드로 작성
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.text = self.textField.text ?? ""
        self.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

