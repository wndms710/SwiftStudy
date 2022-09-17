//
//  PayViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit

class PayViewController: BaseViewController {

//MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        
        showIndicator()
        PayInfoRequest().getPayInfo(self, self.id!)
    }
    
//MARK: - Action
    @IBAction func wayChange(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayWayViewController") as! PayWayViewController
        vc.way = self.payWay
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBAction func wayMaintainBut(_ sender: Any) {
        if wayMaintainCheck.tintColor == Constant().mainColor {
            wayMaintainCheck.tintColor = UIColor(hex: 0xE4E4E4)
            wayMaintainLabel.textColor = UIColor(hex: 0xB0B1B1)
        }
        else {
            wayMaintainCheck.tintColor = Constant().mainColor
            wayMaintainLabel.textColor = .black
        }
    }
    @IBAction func exitBut(_ sender: Any) {

        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tapBungae(_ sender: Any) {
        bungaepayImg.isHighlighted = true
        bungaepayLabel.textColor = .black
        hiddenView.isHidden = false
        
        anotherpayImg.isHighlighted = false
        anotherpayLabel.textColor = UIColor(hex: 0x696868)
    }
    @IBAction func tapAnother(_ sender: Any) {
        anotherpayImg.isHighlighted = true
        anotherpayLabel.textColor = .black
        hiddenView.isHidden = true
        
        bungaepayImg.isHighlighted = false
        bungaepayLabel.textColor = UIColor(hex: 0x696868)
    }
    
    @IBAction func agreeBut(_ sender: Any) {
        if agree == false {
            agreeCheck.tintColor = Constant().mainColor
            self.agree = true
        }
        else {
            agreeCheck.tintColor = UIColor(hex: 0xE4E4E4)
            self.agree = false
        }
    }
    
    @IBAction func allPointUse(_ sender: Any) {
        if point > 0 {
            pointTextField.text = "\(addComma(point))"
            pointLabel.text = "0"
            usedPoint.text = "\(addComma(point)))원"
            totalPrice.text = "\(addComma(price + fee - point))원"
        }
    }
    
    
    @objc func usePointfunc(_ sender: UITextField) {
        if sender.text?.isEmpty == false {
            if let text = sender.text {
                if Int(text)! > point {
                    sender.resignFirstResponder()
                    presentBottomAlert(message: "사용 가능한 포인트가 부족해요")
                    sender.text = nil
                }
                else {
                    self.usepoint = Int(text)!
                    sender.text = "\(addComma(Int(text)!))"
                    pointLabel.text = "\(addComma(point - Int(text)!))"
                    usedPoint.text = "\(addComma(Int(text)!))원"
                    totalPrice.text = "\(addComma(price + fee - Int(text)!))원"
                }
            }
        }
    }
    
    func addComma(_ int: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        let result = numberFormatter.string(from: NSNumber(value: int))
        return result!
    }
    

//MARK: - API
    func didSuccess(_ response: PayInfoResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                self.point = result.pointScore
                self.pointLabel.text = "\(addComma(point))"
                
                let url = URL(string: result.url1)
                self.productImg.load(url: url!)
                
                self.name = result.productName
                self.productName.text = name
                
                self.price = result.price
                self.productPrice.text = "\(addComma(price))원"
                self.subPrice.text = "\(addComma(price))원"
                
                self.fee = result.fee
                self.tip.text = "+\(addComma(fee))원"
                
                self.haveToPayPrice.text = "\(addComma(price + fee))원"
                self.totalPrice.text = "\(addComma(price + fee))원"
                
                dismissIndicator()
            }
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message)
        }
    }
    
    
    
//MARK: - properties
    var payWay: Int = 1
    let wayList = ["신용/체크카드", "카카오페이", "토스", "간편계좌결제", "휴대폰결제"]
    var point: Int = 0
    var price: Int = 0
    var name: String = ""
    var id: Int?
    var fee: Int = 0
    var usepoint: Int = 0
    
    @IBOutlet weak var productImg: UIImageView! //
    @IBOutlet weak var productPrice: UILabel! //
    @IBOutlet weak var productName: UILabel! //
    @IBOutlet weak var subPrice: UILabel! //
    @IBOutlet weak var tip: UILabel! //
    @IBOutlet weak var haveToPayPrice: UILabel! //
    
    @IBOutlet weak var totalPrice: UILabel! //
    
    @IBOutlet weak var pointLabel: UILabel! //
    @IBOutlet weak var usedPoint: UILabel! {
        didSet {
            usedPoint.text = "0원"
        }
    }
    @IBOutlet weak var pointTextField: UITextField! {
        didSet {
            pointTextField.addTarget(self, action: #selector(usePointfunc), for: .editingDidEnd)
        }
    }
    
    
    var agree: Bool = false
    

    @IBOutlet weak var agreeCheck: UIImageView!
    
    @IBOutlet weak var payWayLabel: UILabel!
    @IBOutlet weak var payBut: UIView! {
        didSet {
            Constant().cornerCircle(payBut, 5)
        }
    }
    @IBOutlet weak var allPointView: UIView! {
        didSet {
            Constant().cornerCircle(allPointView, 3)
        }
    }
    
    @IBOutlet weak var wayMaintainCheck: UIImageView! {
        didSet {
            wayMaintainCheck.tintColor = Constant().mainColor
        }
    }
    @IBOutlet weak var wayMaintainLabel: UILabel! {
        didSet {
            wayMaintainLabel.textColor = .black
        }
    }
    @IBOutlet weak var bungaepayImg: UIImageView! {
        didSet {
            bungaepayImg.isHighlighted = false
        }
    }
    @IBOutlet weak var bungaepayLabel: UILabel! {
        didSet {
            bungaepayLabel.textColor = UIColor(hex: 0x696868)
        }
    }
    @IBOutlet weak var anotherpayImg: UIImageView! {
        didSet {
            anotherpayImg.isHighlighted = true
        }
    }
    @IBOutlet weak var anotherpayLabel: UILabel! {
        didSet {
            anotherpayLabel.textColor = .black
        }
    }
    @IBOutlet weak var hiddenView: UIView! {
        didSet {
            hiddenView.isHidden = true
        }
    }

    
    
//MARK: - 결제, 다음화면 API

    @IBAction func tapPayBut(_ sender: Any) {
        if self.agree == false {
            presentAlert(title: "결제 이용약관을 동의해주세요.")
        }
        else {
            showIndicator()
            PayResultRequest().getPayResult(self, Constant.userIdx, id!, usepoint, self.wayList[payWay-1])
        }
    }
    
    func postPayment(_ response: PayResultResponse) {
        if response.isSuccess == true {
            if response.result == "결제 성공" {
                dismissIndicator()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayCompleteViewController") as! PayCompleteViewController
                vc.way = self.payWay
                vc.productId = self.id
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                dismissIndicator()
                presentAlert(title: response.result!)
            }
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message)
        }
    }
    
}




//MARK: - 결제수단
extension PayViewController: PayWayViewControllerDelegate {
    func sendWay(_ way: Int) {
        self.payWay = way
        self.payWayLabel.text = self.wayList[way-1]
    }
}
