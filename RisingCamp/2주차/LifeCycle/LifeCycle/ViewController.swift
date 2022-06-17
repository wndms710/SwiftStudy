//
//  ViewController.swift
//  LifeCycle
//
//  Created by 조주은 on 2022/06/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var uiTextField: UITextField!
    
    @IBAction func didTapAction(_ sender: Any) {
        
        let data : String = uiTextField.text!
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondViewController.result = data

        
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("First : viewDidLoad")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First : viewDidAppear")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")

    }


}

