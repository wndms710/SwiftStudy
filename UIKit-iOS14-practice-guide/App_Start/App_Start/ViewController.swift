//
//  ViewController.swift
//  App_Start
//
//  Created by 조주은 on 2022/04/05.
//

import UIKit

// 실행 - command + R

enum SomeStyle {
    case aa
}

struct SomeStruct {
    var aaaa = ""
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBAction func doSomething(_ sender: Any) {
        testButton.backgroundColor = .orange
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        self.present(detailVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testButton.backgroundColor = UIColor.red
        
    }
}



