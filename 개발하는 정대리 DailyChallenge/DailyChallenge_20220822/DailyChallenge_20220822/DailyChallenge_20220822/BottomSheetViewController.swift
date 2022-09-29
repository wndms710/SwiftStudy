//
//  BottomSheetViewController.swift
//  DailyChallenge_20220822
//
//  Created by 조주은 on 2022/09/29.
//

import UIKit

class BottomSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var receivedView: UIView! {
        didSet {
            receivedView.clipsToBounds = false
            let height = receivedView.bounds.height
            receivedView.layer.cornerRadius = height / 2
        }
    }
    

}
