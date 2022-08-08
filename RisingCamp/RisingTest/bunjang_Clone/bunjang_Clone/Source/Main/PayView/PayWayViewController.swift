//
//  PayWayViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit
protocol PayWayViewControllerDelegate {
    func sendWay(_ way: Int)
}

class PayWayViewController: UIViewController {
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...5 {
            if i == way {
                beSelected(i)
            }
            else {
                beNormal(i)
            }
        }
        
        if way == 1 {
            self.titleLabel.text = "신용/체크카드 안내"
            self.textLabel.text = "• 결제 시 BC카드 TOP포인트, 현대카드 M포인트 사용 가능\n• 체크카드는 카드사 점검시간에 따라 이용이 불가\n• 카드사별 무이자 할부 지원 : BC카드, NH농협카드, KB국민카드, 삼성카드, 신한카드, 하나카드, 롯데카드, 현대카드, 우리카드\n• 일부 상품은 무이자 할부 및 혜택 적용이 불가"
        } else if way == 2 {
            self.titleLabel.text = "카카오페이 안내"
            self.textLabel.text = "• 카카오페이 계좌 또는 카드를 등록하여 간편하게 결제할 수 있는 서비스 입니다. (카드 등록 시 휴대폰과 카드 명의자가 일치해야 합니다.)"
        } else if way == 3 {
            self.titleLabel.text = "토스 안내"
            self.textLabel.text = "• Toss 는 간편송금/결제 서비스며, 번개장터에서는 등록된 계좌와 토스머니를 통해 십게 결제할 수 있습니다.\n• 결제 및 사용관련 문의는 Toss 고객센터 (1599-4905)를 이용바랍니다."
        } else if way == 4 {
            self.titleLabel.text = "간편계좌결제 안내"
            self.textLabel.text = "• 내 계좌를 미리 등록하여 간편하게 결제 할 수 있는 간편 결제 서비스 입니다.\n•간편계좌결제서비스는 최대 200만원까지 결제 가능 합니다."
        } else {
            self.titleLabel.text = "휴대폰결제 안내"
            self.textLabel.text = "• 휴대폰 결제일 경우 결제 당월에만 결제수단 취소가 가능합니다.\n• 휴대폰 결제 한도는 1회 30만원, 월 30만원까지 가능하며, 통신사 수납/가입상태 및 결제 대행사에 따라 한도가 상이할 수 있습니다."
        }
    }
    
    //MARK: - properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var completeView: UIView! {
        didSet {
            Constant().cornerCircle(completeView, 5)
        }
    }
    var way: Int = 1
    var delegate: PayWayViewControllerDelegate?
    
    //MARK: - action
    func beNormal(_ tag: Int) {
        let back = view.viewWithTag(tag)!
        let img = view.viewWithTag(tag+5) as! UIImageView
        
        Constant().cornerCircle(back, 5)
        Constant().makeBorder(back, 0.5, UIColor(hex: 0xF1F1F1).cgColor)
        
        img.tintColor = UIColor(hex: 0xF1F1F1)
    }
    
    func beSelected(_ tag: Int) {
        let back = view.viewWithTag(tag)!
        let img = view.viewWithTag(tag+5) as! UIImageView
        
        Constant().cornerCircle(back, 5)
        Constant().makeBorder(back, 1, Constant().mainColor.cgColor)
        
        img.tintColor = Constant().mainColor
    }
    
    @IBAction func tap1(_ sender: Any) {
        self.way = 1
        for i in 1...5 {
            if i == way {
                beSelected(i)
            }
            else {
                beNormal(i)
            }
        }
        
        self.titleLabel.text = "신용/체크카드 안내"
        self.textLabel.text = "• 결제 시 BC카드 TOP포인트, 현대카드 M포인트 사용 가능\n• 체크카드는 카드사 점검시간에 따라 이용이 불가\n• 카드사별 무이자 할부 지원 : BC카드, NH농협카드, KB국민카드, 삼성카드, 신한카드, 하나카드, 롯데카드, 현대카드, 우리카드\n• 일부 상품은 무이자 할부 및 혜택 적용이 불가"
    }
    @IBAction func tap2(_ sender: Any) {
        self.way = 2
        for i in 1...5 {
            if i == way {
                beSelected(i)
            }
            else {
                beNormal(i)
            }
        }
        self.titleLabel.text = "카카오페이 안내"
        self.textLabel.text = "• 카카오페이 계좌 또는 카드를 등록하여 간편하게 결제할 수 있는 서비스 입니다. (카드 등록 시 휴대폰과 카드 명의자가 일치해야 합니다.)"
    }
    @IBAction func tap3(_ sender: Any) {
        self.way = 3
        for i in 1...5 {
            if i == way {
                beSelected(i)
            }
            else {
                beNormal(i)
            }
        }
        self.titleLabel.text = "토스 안내"
        self.textLabel.text = "• Toss 는 간편송금/결제 서비스며, 번개장터에서는 등록된 계좌와 토스머니를 통해 쉽게 결제할 수 있습니다.\n• 결제 및 사용관련 문의는 Toss 고객센터 (1599-4905)를 이용바랍니다."
    }
    @IBAction func tap4(_ sender: Any) {
        self.way = 4
        for i in 1...5 {
            if i == way {
                beSelected(i)
            }
            else {
                beNormal(i)
            }
        }
        self.titleLabel.text = "간편계좌결제 안내"
        self.textLabel.text = "• 내 계좌를 미리 등록하여 간편하게 결제 할 수 있는 간편 결제 서비스 입니다.\n• 간편계좌결제서비스는 최대 200만원까지 결제 가능 합니다."
    }
    @IBAction func tap5(_ sender: Any) {
        self.way = 5
        for i in 1...5 {
            if i == way {
                beSelected(i)
            }
            else {
                beNormal(i)
            }
        }
        self.titleLabel.text = "휴대폰결제 안내"
        self.textLabel.text = "• 휴대폰 결제일 경우 결제 당월에만 결제수단 취소가 가능합니다.\n• 휴대폰 결제 한도는 1회 30만원, 월 30만원까지 가능하며, 통신사 수납/가입상태 및 결제 대행사에 따라 한도가 상이할 수 있습니다."
    }
    
    @IBAction func applyBut(_ sender: Any) {
        delegate?.sendWay(self.way)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func exitBut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
