//
//  FinishViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/03.
//

import UIKit
import AVFoundation

//MARK: - protocol (전 VC로 데이터 전달)
protocol NextViewControllerDelegate {
    func soundChanged(_ soundOn: Bool)    
//    func nextViewControllerResponse(_ soundOn: Bool)
}

class FinishViewController: UIViewController {
    
    func changedSoundButton() {
        if self.audioPlayer!.isPlaying {
            soundImg.image = UIImage(named: "soundOn")
        } else {
            soundImg.image = UIImage(named: "soundOff")
        }
    }
    
    //MARK: - delegate 선언 (전 VC로 데이터 전달)
    var delegateStart: NextViewControllerDelegate?
    var delegateGame: NextViewControllerDelegate?
    
    //MARK: - 결과 이미지 collection
    @IBOutlet weak var collectionView: UICollectionView!
    var resultImage: [UIImage] = []
    
    //MARK: - 랜덤 짱구 이미지
    @IBOutlet weak var randomImg: UIImageView!
    var imgArr: [UIImage] = [UIImage(named: "짱구 굳")!, UIImage(named: "짱구 부끄")!, UIImage(named: "짱구 뽀뽀")!, UIImage(named: "짱구 윙크")!, UIImage(named: "짱구 하이파이브")!]
    
    
    //MARK: - home
    @IBAction func homeButton(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        homeVC.audioPlayer = self.audioPlayer
//        homeVC.soundOn = self.soundOn
//        self.delegateStart?.soundChanged(self.soundOn)
        homeVC.changedSoundButton(self.soundOn)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - exit
    @IBAction func exitButtom(_ sender: Any) {
        print("exit")
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exit(0)
        }
    }
    
    //MARK: - restart
    @IBAction func restartButton(_ sender: Any) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.audioPlayer = self.audioPlayer
//        gameVC.soundOn = self.soundOn
        self.delegateGame?.soundChanged(self.soundOn)
//        gameVC.changedSoundButton()
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - 점수
    @IBOutlet weak var score: UILabel!
    
    
    //MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
                
        if resultImage.count > 0 {
            self.subTime.text = "소요 시간 : \(self.timeArr[nowPage])초"
        }
    }

    //MARK: - 이미지 랜덤 배정
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("finishVC Appear")
        print("soundOn: \(self.soundOn)")
        
        if self.soundOn == true {
            self.soundImg.image = UIImage(named: "soundOn")
        } else if self.soundOn == false {
            self.soundImg.image = UIImage(named: "soundOff")
        }

        self.randomImg.image = imgArr.randomElement()
        self.score.text = "\(resultImage.count)장!"
    }
    
    
    //MARK: - 개별 시간 표시
    var timeArr: [Int] = []
    @IBOutlet weak var subTime: UILabel!
    
    //MARK: - sound control
    @IBOutlet weak var soundImg: UIImageView!
    var soundOn: Bool = true
   
    var audioPlayer: AVAudioPlayer?
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
    
    //MARK: - sub time
    var nowPage: Int = 0
}

    //MARK: - collectionview extention
extension FinishViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionViewCell", for: indexPath) as! ResultCollectionViewCell
        
        cell.imgView.image = self.resultImage[indexPath.row]

        print("indexPath.row: \(indexPath.row)")
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.size.width
        let height = self.collectionView.frame.size.height
        
        return CGSize(width: width, height: height)
    }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        print("nowPage: \(nowPage)")
        self.subTime.text = "소요 시간 : \(self.timeArr[nowPage])초"

    }
}
