//
//  SNSViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/21.
//

import UIKit

class SNSViewController: UIViewController {
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - properties
    @IBOutlet weak var storeName: UILabel! {
        didSet {
            storeName.text = Secret.storeName
        }
    }
    
    @IBOutlet weak var kakaoView: UIView! {
        didSet {
            Constant().cornerCircle(kakaoView, kakaoView.frame.height / 2)
        }
    }
    @IBOutlet weak var naverView: UIView!{
        didSet {
            Constant().cornerCircle(naverView, naverView.frame.height / 2)
        }
    }
    @IBOutlet weak var facebookView: UIView!{
        didSet {
            Constant().cornerCircle(facebookView, facebookView.frame.height / 2)
        }
    }
    @IBOutlet weak var appleView: UIView!{
        didSet {
            Constant().cornerCircle(appleView, appleView.frame.height / 2)
        }
    }
    
    @IBAction func nextBut(_ sender: Any) {
        let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
        let navigatioinVC = mainStory.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController

        changeRootViewController(navigatioinVC)
    }
}
