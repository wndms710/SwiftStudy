//
//  ViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    //MARK: - 사운드
    var audioPlayer: AVAudioPlayer?
    var soundOn: Bool = true

    @IBOutlet weak var soundImg: UIImageView! {
        didSet {
            DispatchQueue.global().async {
                self.playMusic()
            }
        }
    }
    
    @IBAction func soundButton(_ sender: Any) {
        DispatchQueue.global().async {
            if self.audioPlayer!.isPlaying {
                DispatchQueue.main.async {
                    self.soundImg.image = UIImage(named: "soundOff")
                    self.soundOn = false
                    print("soundOn: \(self.soundOn)")
                }
                self.audioPlayer?.pause()
            } else {
                DispatchQueue.main.async {
                    self.soundImg.image = UIImage(named: "soundOn")
                    self.soundOn = true
                    print("soundOn: \(self.soundOn)")
                }
                self.audioPlayer?.play()
            }
        }
    }

    
    @objc private func playMusic() {
        let url = Bundle.main.url(forResource: "짱구 오프닝", withExtension: "mp3")
        if let url = url {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                audioPlayer?.numberOfLoops = -1
            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - How to play
    @IBAction func tapHowTo(_ sender: Any) {
        let howVC = self.storyboard?.instantiateViewController(withIdentifier: "HowViewController") as! HowViewController
        howVC.modalPresentationStyle = .overCurrentContext
        self.present(howVC, animated: false)
    }
 
    //MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func startButton(_ sender: Any) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.audioPlayer = self.audioPlayer
        gameVC.soundOn = self.soundOn
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("homeView Appear")
        print("soundOn: \(soundOn)")
        if self.soundOn == true {
            self.soundImg.image = UIImage(named: "soundOn")
        } else if self.soundOn == false {
            self.soundImg.image = UIImage(named: "soundOff")
        }
    }
}

