//
//  LaunchScreenViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/26.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    //MARK: - imageview
    @IBOutlet weak var imgView: UIImageView! {
        didSet {
            imgView.sizeThatFits(CGSize(width: 1, height: 1))
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImg(imgView)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.goToNext()
        }
    }
    
    
    //MARK: - animation
    func animateImg(_ sender: UIImageView) {
        UIImageView.animateKeyframes(withDuration: 1.2, delay: 0) {
            UIImageView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4 / 1.2, animations:  {
                sender.transform = CGAffineTransform(scaleX: 180, y: 180)
            })
            
            UIImageView.addKeyframe(withRelativeStartTime: 0.55 / 1.2, relativeDuration: 0.3 / 1.2, animations:  {
                sender.transform = CGAffineTransform(scaleX: 160, y: 160)
            })
        }
    }
    
    //MARK: - 다음 화면으로
    func goToNext() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BeforeSignViewController") as! BeforeSignViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
}
