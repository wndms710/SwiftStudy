//
//  OptionViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/17.
//

import UIKit
import Then
import TweeTextField


protocol OptionDelegate {
    func sendDate(_ count: String, _ productState: String, _ exchangedPossible: String)
}

class OptionViewController: BaseViewController {
    
    //MARK: - properties
    
    // delegate
    var delegate: OptionDelegate?
    
    // 중고 여부
    var productState: String = "중고상품"
    
    // 교환 가능 여부
    var exchangedPossible: String = "불가"
    
    
    //MARK: 수량
    var count: String = "1"
    
    @IBOutlet weak var numView: UIView! {
        didSet {
            Constant().cornerCircle(numView, 5)
            Constant().makeBorder(numView, 0.5, Constant().lightGreyColor.cgColor)
        }
    }
    // 화면 눌렀을 때 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBOutlet weak var textField: TweeActiveTextField!
    
    
    
    //MARK: 중고상품
    @IBOutlet weak var junggoLabel: UILabel!
    @IBOutlet weak var junggoView: UIView! {
        didSet {
            Constant().cornerCircle(junggoView, 5)
        }
    }
    
    
    //MARK: 새상품
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var newView: UIView! {
        didSet {
            Constant().cornerCircle(newView, 5)
        }
    }

    
    //MARK: 불가
    @IBOutlet weak var impoLabel: UILabel!
    @IBOutlet weak var impoView: UIView! {
        didSet {
            Constant().cornerCircle(impoView, 5)
        }
    }

    
    
    
    //MARK: 가능
    @IBOutlet weak var posLabel: UILabel!
    @IBOutlet weak var posView: UIView! {
        didSet {
            Constant().cornerCircle(posView, 5)
        }
    }

    
    
    func changedState(_ tag: Int) {
        let backView = self.view.viewWithTag(tag)!
        let label = self.view.viewWithTag(tag+4) as! UILabel
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor.black
        backView.backgroundColor = UIColor.clear
    }
    
    func changedHighlight(_ tag: Int) {
        let backView = self.view.viewWithTag(tag)!
        let label = self.view.viewWithTag(tag+4) as! UILabel
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = Constant().mainColor
        backView.backgroundColor = UIColor(hex: 0xFBEFEF)
    
    }
    
    
    //MARK: - 중고상품 여부 선택
    let stateList = ["중고상품", "새상품"]

    @IBAction func checkProductState(_ sender: UIButton) {
        for i in 1...2 {
            if sender.tag == i {
                changedHighlight(i)
                self.productState = stateList[i-1]
                AddProductInfo.productState = stateList[i-1]
            }
            else {
                changedState(i)
            }
        }
        print(self.productState)
    }
    
    
    //MARK: - 교환 여부 선택
    let exchangeList = ["불가", "가능"]
    
    @IBAction func checkExchange(_ sender: UIButton) {
        for i in 3...4 {
            if sender.tag == i {
                changedHighlight(i)
                self.exchangedPossible = exchangeList[i-3]
                AddProductInfo.exchagedEnable = exchangeList[i-3]
            }
            else {
                changedState(i)
            }
        }
        print(self.exchangedPossible)
    }
    
    
    
    //MARK: 선택 완료
    @IBOutlet weak var compleView: UIView! {
        didSet {
            Constant().cornerCircle(compleView, 5)
            Constant().makeBorder(compleView, 0.5, Constant().lightGreyColor.cgColor)
        }
    }
    @IBAction func compleBut(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func didSetIsUsed() {
        if productState == "중고상품" {
            changedHighlight(1)
            changedState(2)
        }
        else {
            changedHighlight(2)
            changedState(1)
        }
    }
    
    func didSetExchange() {
        if exchangedPossible == "불가" {
            changedHighlight(3)
            changedState(4)
        }
        else {
            changedHighlight(4)
            changedState(3)
        }
    }
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        didSetIsUsed()
        didSetExchange()
        self.textField.text = self.count
    }


    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.count = self.textField.text!
        AddProductInfo.count = Int(self.count)!
        delegate?.sendDate(self.count, self.productState, self.exchangedPossible)
    }
    
}
