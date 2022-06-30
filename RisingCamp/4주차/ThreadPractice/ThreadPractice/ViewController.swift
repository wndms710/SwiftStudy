//
//  ViewController.swift
//  ThreadPractice
//
//  Created by 조주은 on 2022/06/30.
//

import UIKit

class ViewController: UIViewController {
    
    var milk: Int = 0

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    var colorList: [UIColor] = [UIColor.black, UIColor.red, UIColor.yellow, UIColor.systemPink, UIColor.blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
//        firstView.backgroundColor = .black
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            for color in self.colorList {
                
                DispatchQueue.main.sync {
      
                    self.firstView.backgroundColor = color
                }
                usleep(1000000)
            }
        }


        DispatchQueue.global(qos: .userInitiated).async {

            for color in self.colorList.reversed() {
                
                DispatchQueue.main.sync {
                    self.secondView.backgroundColor = color
                }
                
                usleep(1000000)
            }

        }
    }
    
    
    
}
