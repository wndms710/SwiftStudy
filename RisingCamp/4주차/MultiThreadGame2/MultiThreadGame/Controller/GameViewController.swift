//
//  GameViewController.swift
//  MultiThreadGame
//
//  Created by 조주은 on 2022/07/03.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController, NextViewControllerDelegate {
    func nextViewControllerResponse(_ soundOn: Bool) {
        self.soundOn = soundOn
    }
    
    
    //MARK: - Character setting
    var characterData: [CharacterFile] = []
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var characterSketch: UIImageView!
    @IBOutlet weak var wordView: UIView!
    @IBOutlet weak var wordLabel: UILabel!
    
    //MARK: - 전체 타이머
    var timer: Timer?
    var timerNum: Int = 0

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var clockImg: UIImageView!
    
    // 타이머 시작
    public func startTimer() {
        print("startTimer()")

//         기존에 타이머 동작중이면 중지 처리
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
        
        // 타이머 사용값 초기화
        timerNum = 60
        DispatchQueue.main.async {
            self.timerLabel.text = "\(self.timerNum)"
        }
        // 1초 간격 타이머 시작
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)

    }
    
    // 타이머 동작 func
    @objc func timerCallback() {
//        print("timerCallback(), timerNum: \(timerNum)")
        // timerNum이 0이면(60초 경과) 타이머 종료
        if (timerNum == 0) {
            subTimer.invalidate()
//            subTimer = nil
            timer?.invalidate()
            timer = nil
            
            // 타이머 종료 후 처리
            let finishVC = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
            finishVC.resultImage = self.resultImg
            finishVC.timeArr = self.elapsedArr
            finishVC.audioPlayer = self.audioPlayer
//            finishVC.soundOn = self.soundOn
            finishVC.delegate = self
            
            self.navigationController?.pushViewController(finishVC, animated: true)
        }
        
        // timerNum - 1 감소시키기
        timerNum -= 1
        let progressPercentage = Float(timerNum) / 60.0
        DispatchQueue.main.async {
            self.timerLabel.text = "\(self.timerNum)"
            self.progressView.setProgress(progressPercentage, animated: true)
        }
        DispatchQueue.main.async {
            if progressPercentage > 0.6 {
                self.progressView.progressTintColor = .systemYellow
            } else if progressPercentage > 0.3 {
                self.progressView.progressTintColor = .orange
            } else {
                self.progressView.progressTintColor = .red
            }
        }
    }
    
    
    
    
    //MARK: - 개별 타이머
    // 시작 시점의 시간
    var startTime = 0.0
    // 경과된 시간
    var elapsed = 0.0
    
    var subTimer = Timer()
    
//    @IBOutlet weak var subtime: UILabel!
    
    func startSubTimer() {
        print("startSubTimer()")
        startTime = Date().timeIntervalSince1970 - elapsed
        subTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        elapsed = Date().timeIntervalSince1970 - startTime
//        let date = Int(elapsed)
//        DispatchQueue.main.async {
//            self.subtime.text = "\(date)"
//        }
    }
    
    
    //MARK: - canvas
    @IBOutlet weak var canvasView: UIImageView!
    
    var lastPoint: CGPoint! // 바로 전에 터치하거나 이동한 위치
    var lineSize: CGFloat = 4.0 // 선의 두께
    var lineColor = UIColor.black.cgColor   // 선의 색상
    
    
    @IBAction func clearImgView(_ sender: Any) {
        DispatchQueue.global().async {
            print("clear img")
            DispatchQueue.main.async {
                self.canvasView.image = nil
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch   // 현재 발생한 터치 이벤트를 가지고 옴
        lastPoint = touch.location(in: canvasView)  // 터치된 위치를 저장
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(canvasView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)  // 라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        let touch = touches.first! as UITouch   // 현재 발생한 터치 이벤트
        let currPoint = touch.location(in: canvasView)
        
        canvasView.image?.draw(in: CGRect(x: 0, y: 0, width: canvasView.frame.size.width, height: canvasView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))    // 이전에 이동된 위치인 lastPoint로 시작
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y)) // lastPoint에서 현재 위치 currentPoint까지 선 추가
        UIGraphicsGetCurrentContext()?.strokePath()
        
        canvasView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint   // 현재 터치된 위치를 lastPoint 변수에 할당
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(canvasView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)  // 라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        canvasView.image?.draw(in: CGRect(x: 0, y: 0, width: canvasView.frame.size.width, height: canvasView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))    // 이전에 이동된 위치인 lastPoint로 시작
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) // lastPoint에서 현재 위치 currentPoint까지 선 추가
        UIGraphicsGetCurrentContext()?.strokePath()
        
        canvasView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
  
        characterData.append(CharacterFile(image: UIImage(named: "부리부리대마왕")!, sketch: UIImage(named: "부리스케치")!, word: ["나 한번만 그려줘", "날 그리는 걸 허락해 주지", "모델 비용 10억", "이 정도면 잘생긴 편 아닌가..."]))
        characterData.append(CharacterFile(image: UIImage(named: "액션가면")!, sketch: UIImage(named: "액션 스케치")!, word: ["짱구야, 잘 부탁한다!", "우하하하하! 우하하하하!", "정의의 용사가 나가신다!", "액션 빔!!!"]))
        characterData.append(CharacterFile(image: UIImage(named: "건담로봇")!, sketch: UIImage(named: "건담 스케치")!, word: ["건담 로봇, 출동!", "짱구야, 잘 부탁해", "건담 펀치 발사!!!", "짱구야, 힘들 땐 우리를 부르렴!"]))
        characterData.append(CharacterFile(image: UIImage(named: "짱구")!, sketch: UIImage(named: "짱구 스케치")!, word: ["예쁜 누나! 나랑 같이 놀아요~", "호호이~!", "떡잎마을 방범대 파이어!!!", "다녀오겠습니다람쥐~"]))
        characterData.append(CharacterFile(image: UIImage(named: "짱아")!, sketch: UIImage(named: "짱아 스케치")!, word: ["따야", "다다다다다다다다", "히히, 땨아~", "따이댜! 따다다다따따!!!"]))
        characterData.append(CharacterFile(image: UIImage(named: "흰둥이")!, sketch: UIImage(named: "흰둥이 스케치")!, word: ["망망!", "망!", "먕먕! 먕!!"]))
        characterData.append(CharacterFile(image: UIImage(named: "짱구 엄마")!, sketch: UIImage(named: "짱구 엄마 스케치")!, word: ["다녀왔습니다라고 해야지!", "짱구 이 놈은 또 어디간거야!", "미선이에요~", "예쁘게 그려줘용ㅎㅎ"]))
        characterData.append(CharacterFile(image: UIImage(named: "짱구 아빠")!, sketch: UIImage(named: "짱구 아빠 스케치")!, word: ["난 언제쯤 부장이 될까..", "키야~ 오늘 맥주 죽인다~!", "하~ 오늘따라 우리 집이 행복하게 느껴지는데?", "짱구야! 넌 역시 신형만의 아들이야!"]))
        
        wordView.clipsToBounds = true
        wordView.layer.cornerRadius = 40

    }
    
//    //MARK: - Popup
//    @IBAction func showPopup(_ sender: Any) {
//        print("show popup")
//        self.timer?.invalidate()
//        self.timer = nil
//
//        self.subTimer?.invalidate()
//        self.subTimer = nil
//
//        let popupVC = self.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
//        popupVC.modalPresentationStyle = .overCurrentContext
//        present(popupVC, animated: false)
//
//    }
    
    //MARK: - 랜덤으로 set 변경
    func randomSet() {
        print("randomSet()")
        DispatchQueue.main.async {
            self.canvasView.image = nil
        }
        let randomIndex = Int.random(in: 0...characterData.count-1)
        print("randomIndex: \(randomIndex)")

        DispatchQueue.main.async {
            self.characterImg.image = self.characterData[randomIndex].image
            self.characterSketch.image = self.characterData[randomIndex].sketch
            self.characterSketch.alpha = 0.2
            self.wordLabel.text = self.characterData[randomIndex].word?.randomElement()
        }
    }
    
    //MARK: - willAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.global().async {
            self.randomSet()
            
            DispatchQueue.main.async {
                self.progressView.progress = 1.0
                self.imgCount = 0
                self.resultImg = []
                self.elapsedArr = []
                self.timerNum = 60
                self.timerLabel.text = "60"
                self.startTime = 0.0
            }
            
            DispatchQueue.main.async {
                if self.soundOn == true {
                    self.soundImg.image = UIImage(named: "soundOn")
                } else if self.soundOn == false {
                    self.soundImg.image = UIImage(named: "soundOff")
                }
            }
        
        
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                self.startTimer()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                self.startSubTimer()
            }
        
        }
        
        let readyVC = self.storyboard?.instantiateViewController(withIdentifier: "ReadyViewController") as! ReadyViewController
        readyVC.modalPresentationStyle = .overCurrentContext
        self.present(readyVC, animated: false)
    }
    
    
    //MARK: - check buttom
    var imgCount: Int = 0
    var resultImg: [UIImage] = []
    var elapsedArr: [Int] = []
    @IBAction func checkButtom(_ sender: Any) {
        DispatchQueue.global().async {
            
            self.startTime = Date().timeIntervalSince1970
            print("elapsed: \(Int(self.elapsed))")
            self.elapsedArr.append(Int(self.elapsed))
            self.elapsed = 0.0
            
            print("check click")
            
            DispatchQueue.main.async {
                self.imgCount += 1
                self.timerNum += 10
                if self.timerNum > 60 {
                    self.timerNum = 60
                }
                
                self.resultImg.append(self.canvasView.image ?? UIImage())
            }
            
            print("imgCount: \(self.imgCount)")
            print("resultImg.count: \(self.resultImg.count)")
            self.randomSet()

        }
    }
    
    //MARK: - fail button
    @IBAction func failButtom(_ sender: Any) {
        let finishVC = self.storyboard?.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
        finishVC.resultImage = self.resultImg
        finishVC.timeArr = self.elapsedArr
        finishVC.audioPlayer = self.audioPlayer
        finishVC.soundOn = self.soundOn
        
        print("timer?.invalidate()")
        timer?.invalidate()
        timer = nil
        print("subTimer.invalidate()")
        subTimer.invalidate()
        
        self.navigationController?.pushViewController(finishVC, animated: true)
    }
    
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
    
    //MARK: - progress bar
    @IBOutlet weak var progressView: UIProgressView! {
        didSet {
            progressView.clipsToBounds = true
            progressView.layer.cornerRadius = 8
            
        }
    }

    
}
