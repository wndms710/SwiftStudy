//
//  PayOptionViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit
protocol PayOptionViewControllerDelegate {
    func sendData(_ isDeliver: Bool)
}

class PayOptionViewController: UIViewController {
    //MARK: - life
    override func viewDidLoad() {
        super.viewDidLoad()
//        dismissKeyboardWhenTappedAround()
    }
    
    
    
    //MARK: - properties
    var isDeliver: Bool = true
    var delegate: PayOptionViewControllerDelegate?
    
    @IBOutlet weak var deliveryView: UIView! {
        didSet {
            Constant().cornerCircle(deliveryView, 5)
            Constant().makeBorder(deliveryView, 1, Constant().mainColor.cgColor)
        }
    }
    @IBOutlet weak var directView: UIView! {
        didSet {
            Constant().cornerCircle(directView, 5)
            Constant().makeBorder(directView, 1, UIColor(hex: 0xE2E2E2).cgColor)
        }
    }
    @IBOutlet weak var tag2Img: UIImageView! {
        didSet {
            tag2Img.isHighlighted = false
        }
    }
    
    @IBOutlet weak var tag1Img: UIImageView! {
        didSet {
            tag1Img.isHighlighted = true
        }
    }
    
    
    
    //MARK: - action
    @IBAction func tapOption(_ sender: UIButton) {
        if sender.tag == 1 {
            beSelected(1)
            beUnselected(2)
            
            self.isDeliver = true
//            print(isDeliver)
        }
        else {
            beSelected(2)
            beUnselected(1)
            
            self.isDeliver = false
//            print(isDeliver)
        }
    }
    
    func beSelected(_ tag: Int) {
        let selectedView = view.viewWithTag(tag+2)
        let img = view.viewWithTag(tag) as! UIImageView
        
        selectedView?.layer.borderColor = Constant().mainColor.cgColor
        img.isHighlighted = true
    }
    
    func beUnselected(_ tag: Int) {
        let selectedView = view.viewWithTag(tag+2)
        let img = view.viewWithTag(tag) as! UIImageView
        
        selectedView?.layer.borderColor = UIColor(hex: 0xE2E2E2).cgColor
        img.isHighlighted = false
    }
    
    
    @IBOutlet weak var nextBut: UIButton! {
        didSet {
            Constant().cornerCircle(nextBut, 5)
        }
    }
    @IBAction func tapNextBut(_ sender: Any) {
        delegate?.sendData(isDeliver)
        self.dismiss(animated: true) 
    }
}
