//
//  ViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    let url = Bundle.main.url(forResource: "짱구 평화", withExtension: "mp3")!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }
    
    //MARK: 음악 재생
    @IBAction func soundControl(_ sender: Any) {
        audioPlayer.play()
    }
    
}

