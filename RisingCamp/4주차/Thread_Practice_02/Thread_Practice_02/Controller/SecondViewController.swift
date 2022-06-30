//
//  SecondViewController.swift
//  Thread_Practice_02
//
//  Created by 조주은 on 2022/06/30.
//

import UIKit

class SecondViewController: UIViewController {
    
    let colorArr: [UIColor] = [.red, .orange, .yellow, .green, .blue, .systemIndigo, .purple]

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor01()
//        setupColor02()
//        setupLabel()
    }
    
    // 1. DispatchQueue.main이 없는 경우
    private func setupColor01() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in 0 ... 100 {
                
                self.firstView.backgroundColor = self.colorArr.randomElement()
                
                usleep(100000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in 0 ... 100 {
                
                self.secondView.backgroundColor = self.colorArr.randomElement()
                
                usleep(100000)
            }
        }
        
    }
    
    
    
    // 2. DisPatchQueue.main을 적용한 경우
    private func setupColor02() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in 0 ... 100 {
                
                DispatchQueue.main.async {
                    self.firstView.backgroundColor = self.colorArr.randomElement()
                }
                usleep(1000000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in 0 ... 100 {
                
                DispatchQueue.main.async {
                    self.secondView.backgroundColor = self.colorArr.randomElement()
                }
                usleep(1000000)
            }
        }
    }
    
    
    // UI Update를 동기처리 한 경우
    private func setupLabel() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("2초 뒤에 실행한다.")
        }
        
        DispatchQueue.global().async {
            print("before textLabel update")
            usleep(1000000)
            
            DispatchQueue.main.sync {
                self.label.text = "Test1"
                print("update textLabel", self.label.text!)
            }
            usleep(1000000)
            
            print("after textLabel update Test1")
            
            DispatchQueue.main.sync {
                self.label.text = "Test2"
                print("update textLabel", self.label.text!)
            }
            
            print("after textLabel update Test2")
        }
    }
}
