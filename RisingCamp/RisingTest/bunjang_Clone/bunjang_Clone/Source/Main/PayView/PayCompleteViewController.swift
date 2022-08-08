//
//  PayCompleteViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit

class PayCompleteViewController: UIViewController {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: = properties
    var productId: Int?
    
    let wayList = ["신용/체크카드", "카카오페이", "토스", "간편계좌결제", "휴대폰결제"]
    var way: Int = 1
    @IBOutlet weak var wayLabel: UILabel! {
        didSet {
            wayLabel.text = "\(wayList[way-1])로\n결제가 완료되었습니다"
        }
    }
    @IBOutlet weak var buttonView: UIView! {
        didSet {
            Constant().cornerCircle(buttonView, 5)
        }
    }
    
    //MARK: - action
    @IBAction func tapNextBur(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayDetailViewController") as! PayDetailViewController
        vc.productId = self.productId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func exitBut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
