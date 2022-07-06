//
//  ViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, NextViewControllerDelegate {

    func soundChanged(_ soundOn: Bool) {
        print("Start: toHome delegate")
        self.soundOn = soundOn
        print("soundChanged")
    }
    
//    func nextViewControllerResponse(_ soundOn: Bool) {
//        print("homeVC delegate")
//        self.soundOn = soundOn
//    }
    
    func changedSoundButton(_ soundOn: Bool) {
        print("changedSoundButton")
        self.soundOn = soundOn
        print("home.soundOn = \(self.soundOn)")
//        if self.audioPlayer!.isPlaying {
//            soundImg?.image = UIImage(named: "soundOn")
//        } else {
//            soundImg?.image = UIImage(named: "soundOff")
//        }

    }
     
    //MARK: - 사운드
    var audioPlayer: AVAudioPlayer?
    var soundOn: Bool = true

    @IBOutlet weak var soundImg: UIImageView! {
        didSet {
            soundImg.image = UIImage(named: "soundOn")
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
//        self.soundOn = true
        
//        let finishVC = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
//        finishVC.delegateStart = self
    
    }

    @IBAction func startButton(_ sender: Any) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.audioPlayer = self.audioPlayer
        gameVC.soundOn = self.soundOn
        
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let finishVC = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
        finishVC.delegateStart = self
        
        print("homeView Appear")
        print("soundOn: \(soundOn)")
//        if self.soundOn == true {
//            self.soundImg.image = UIImage(named: "soundOn")
//        } else if self.soundOn == false {
//            self.soundImg.image = UIImage(named: "soundOff")
//        }
    }
}

