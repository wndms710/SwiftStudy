//
//  BottomSheetViewController.swift
//  DailyChallenge_20220821
//
//  Created by 조주은 on 2022/09/28.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    
    //MARK: - top properties
    var count = 1

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var grLabel: UILabel!
    @IBOutlet weak var onePriceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var minusBut: UIButton!
    @IBOutlet weak var plusBut: UIButton!
    @IBOutlet weak var countView: UIView!
    
    
    //MARK: set top properties
    func setTopProperties() {
        nameLabel.text = "Dragon Fruit"
        grLabel.text = "200gr"
        onePriceLabel.text = "$45"
        countLabel.text = "\(count)"
        
        topView.setViewCornerRadius(radius: 8)
        minusBut.setViewCornerRadius(radius: 8)
        plusBut.setViewCornerRadius(radius: 8)
        countView.setViewCornerRadius(radius: 8)
        countView.makeBorder(color: UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1).cgColor, width: 1)
    }
    
    
    //MARK: - text field padding
    @IBOutlet weak var textField: UITextField!
    func setTextfieldPadding() {
        textField.setLeftPaddingPoints(10)
    }
    
    
    //MARK: - bottom properties
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var voucherLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var checkoutView: UIView!
    
    
    //MARK: set bottom properties
    func setBottomProperties() {
        priceLabel.text = "$155"
        feeLabel.text = "$8"
        voucherLabel.text = "None"
        totalPriceLabel.text = "$163"
        
        checkoutView.setViewCornerRadius(radius: 8)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTopProperties()
        setTextfieldPadding()
        setBottomProperties()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
 
}
