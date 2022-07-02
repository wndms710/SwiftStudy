//
//  SoundController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/03.
//

import Foundation
import AVFoundation

class SoundController {
    
    var audioPlayer: AVAudioPlayer?
    
    func playMusic() {
        let url = Bundle.main.url(forResource: "짱구 평화", withExtension: "mp3")!
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
        
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
}
