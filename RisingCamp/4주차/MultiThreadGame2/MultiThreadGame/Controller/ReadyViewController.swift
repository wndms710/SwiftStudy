//
//  ReadyViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/05.
//

import UIKit

class ReadyViewController: UIViewController {
    var strArray: [String] = ["3", "2", "1", "GO!", ""]
    @IBOutlet weak var countLabel: UILabel!
    var timer: Timer?
    var timerNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerNum = 0
        startTimer()
    }
    
    // 타이머 시작
    public func startTimer() {
//        print("startTimer()")

//         기존에 타이머 동작중이면 중지 처리
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
        
        // 타이머 사용값 초기화
        timerNum = 3

        // 1초 간격 타이머 시작
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)

    }
    
    // 타이머 동작 func
    @objc func timerCallback() {
//        print("timerCallback(), timerNum: \(timerNum)")
        // timerNum이 0이면(60초 경과) 타이머 종료
        if (timerNum == 0) {
            timer?.invalidate()
            timer = nil
            
            // 타이머 종료 후 처리
            self.dismiss(animated: false)
        }
        
        // timerNum - 1 감소시키기
        DispatchQueue.main.async {
//            print("3 - self.timerNum: \(3 - self.timerNum)")
            self.countLabel.text = "\(self.strArray[3 - self.timerNum])"
        }
        timerNum -= 1



    }
    

}
