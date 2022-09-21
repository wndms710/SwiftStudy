//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 조주은 on 2022/09/21.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    
    // 에러 떴을 때 터미널에 po 확인하고싶은변수 입력하면 무슨 값이 들어가 있는지 확인할 수 있다.
    
    
    var movieResult: MovieResult?
    
    var player: AVPlayer?


    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        }
    }
    @IBOutlet weak var titlelabel: UILabel! {
        didSet {
            titlelabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    @IBOutlet weak var movieContainer: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titlelabel.text = movieResult?.trackName
        descriptionLabel.text = movieResult?.longDescription
        
        // viewDidLoad는 작업창의 크기를 상태로 가지고 있어서 bounds 값을 실제 디바이스 크기 값으로 가져올 수 없음
//        if let hasURL = movieResult?.previewUrl {
//            makePlayerAndPlay(urlString: hasURL)
//        }
    }
    
    // 실제 디바이스의 크기값을 가져옴
    override func viewDidAppear(_ animated: Bool) {
        if let hasURL = movieResult?.previewUrl {
            makePlayerAndPlay(urlString: hasURL)
        }
    }
    
    
    func makePlayerAndPlay(urlString: String) {
        
        if let hasURL = URL(string: urlString) {
            self.player = AVPlayer(url: hasURL)
            let playerLayer = AVPlayerLayer(player: player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            
            self.player?.play()
        }
    }
    
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    

}
