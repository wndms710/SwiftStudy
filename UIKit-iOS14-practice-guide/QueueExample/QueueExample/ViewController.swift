//
//  ViewController.swift
//  QueueExample
//
//  Created by 조주은 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController {
    // 메인 스레드가 계속 정상적으로 작동하는지 확인
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var finishLabel: UILabel!
    // dispatch queue
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
            self.timerLabel.text = Date().timeIntervalSince1970.description      // Date 값을 숫자로 제공해주는 것
            // description  : 해당되는 내용을 String으로 반환
        }
    }
    
    @IBAction func action1(_ sender: Any) {
        // main스레드에서 작동
//        finishLabel.text = "끝"
        
        simpleClosure {
            self.finishLabel.text = "끝"
            // 여기에서만 main 스레드로 설정해도 됨
//            DispatchQueue.main.async {
//                self.finishLabel.text = "끝"
//            }
        }
    }
    
    func simpleClosure(completion: @escaping () -> Void) {      // 안에 있는 걸 밖으로 빼주어야 해서 @escaping
        
        // 새로운 작업자(스레드)에게 작업 맡김
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)  // main스레드
                print(index)
            }
            // UILabel은 무조건 main 스레드에서 작동해야 함
            DispatchQueue.main.async {
                completion()
            }
            
//            completion()
        }
    }
    
    @IBAction func action2(_ sender: Any) {
        
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        queue1.async(group: dispatchGroup, qos: .background) {
            dispatchGroup.enter()   // 작업 시작
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()   // 작업 끝
            }
        }
        queue2.async(group: dispatchGroup, qos: .userInteractive) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 10..<20 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        queue3.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 20..<30 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("끝")
        }
    }

    @IBAction func action3(_ sender: Any) {
        // deadlock
//        DispatchQueue.main.sync {
//            print("main sync")
//        }
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        queue1.sync {
            for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
            
            // deadlock -> 상대 작업이 끝날 때까지 서로 계속 기다리는 상태
//            queue1.sync {
//                for index in 10..<20 {
//                        Thread.sleep(forTimeInterval: 0.2)
//                        print(index)
//                }
//            }
        }
        queue2.sync {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
    }

}
