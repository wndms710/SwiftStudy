//
//  ViewController.swift
//  LifeCycle
//
//  Created by 조주은 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    // 1. property
    @IBAction func goSecondView(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondViewController.text = self.textField.text ?? "None"
        
        self.present(secondViewController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 2. segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondViewController {
            let secondViewController = segue.destination as! SecondViewController
        
        secondViewController.text = self.textField.text ?? "NoneSegue"
        }
    }

}

