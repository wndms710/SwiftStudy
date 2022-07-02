//
//  ViewController.swift
//  Thread_Practice_02
//
//  Created by 조주은 on 2022/06/30.
//

import UIKit

class ViewController: UIViewController {
    
    /// SingleTon
    var myMoney: Int = 100  // - 5

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupData01()
//        setupData02()
        setupData03()
    }
    
    /// 1. 데이터가 순서대로 나타나는 경우
    private func setupData01() {
        // 0 -> 100 으로 오름차순으로 숫자를 print 한다.
        ascendingNumber()
        
        // 100 -> 0 으로 내림차순으로 숫자를 print 한다.
        descendingNumber()
    }
    
    /// 2. 데이터가 섞여서 나타나는 경우
    private func setupData02() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.ascendingNumber() // 0 -> 100
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.descendingNumber() // 100 -> 0
        }
    }
    
    /// 3. 공유자원의 문제
    private func setupData03() {
        
        // 첫 번째 출금 : 맥북비용
        DispatchQueue.global(qos: .userInteractive).async {
            var currentMoney = self.myMoney // 100
            currentMoney -= 98 // 2
            usleep(100000)
            self.myMoney = currentMoney // 2
        }
        
        // 두 번째 출금 : 대중교통비용
        DispatchQueue.global(qos: .userInteractive).async {
            var currentMoney = self.myMoney // 2
            currentMoney -= 7
            self.myMoney = currentMoney // -5
        }
    
        print("DEBUG>> 현재 잔액 : \(self.myMoney) ")
        if self.myMoney < 0 {
            print("DEBUG>> ❗️ 통장 잔액이 부족합니다. ")
            
        } else {
            print("DEBUG>> 🦞 랍스터 먹을 돈이 있습니다. ")
        }
    }
    
    
    private func ascendingNumber() {
        for i in 0...100 {
            print("🍺  ",i)
            usleep(100000)
        }
    }
    
    private func descendingNumber() {
        for i in (0...100).reversed() {
            print("🍗  ",i)
            usleep(100000)
        }
    }
    
    //        didFinishDoSomething { result in
    //            if result == 100 {
    //                print("돈이 부족합니다.")
    //            } else {
    //                print("UI Update")
    //            }
    //        }
        
    //    func didFinishDoSomething(onCompleted : @escaping (Int) -> Void) {
    //        let result = 123 // <-- 100분
    //        onCompleted(result)
    //    }
    //    }

}

