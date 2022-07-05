//
//  PopupViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/03.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Continue
    @IBAction func continueButtom(_ sender: Any) {
        print("continue click")
//        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
//        gameVC.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(gameVC.timerCallback), userInfo: nil, repeats: true)
//    
        self.dismiss(animated: false)
    }
    
    
    //MARK: - Restart
    @IBAction func restartButton(_ sender: Any) {
        print("restart click")
        self.dismiss(animated: false)
    }
    
    //MARK: - Exit
    @IBAction func exitButton(_ sender: Any) {
        print("exit click")
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exit(0)
        }
    }
}
