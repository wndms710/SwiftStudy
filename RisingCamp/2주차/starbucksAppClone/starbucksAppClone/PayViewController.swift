//
//  PayViewController.swift
//  starbucksAppClone
//
//  Created by 조주은 on 2022/06/16.
//

import UIKit

class PayViewController: UIViewController {
    @IBOutlet weak var payView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.payView.layer.shadowColor = UIColor.black.cgColor
        self.payView.layer.masksToBounds = false
        self.payView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.payView.layer.shadowRadius = 5
        self.payView.layer.shadowOpacity = 0.1

        self.navigationItem.title = "Pay"

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
