//
//  ViewController.swift
//  DaliyChallenge_20220820
//
//  Created by 조주은 on 2022/09/27.
//

import UIKit


enum fontMode {
    case semibold
    case light
    case regular
}

class ViewController: BaseViewController {
    
    //MARK: - top Label
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topDescriptionLabel: UILabel!

    
    //MARK: - middle label
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var cvcLabel: UILabel!
    @IBOutlet weak var cvcDescriptionLabel: UILabel!
    
    
    //MARK: - set label
    func setTopLabel() {
        topLabel.text = "Enter your payment details"
        setSfFont(label: topLabel, style: .semibold, size: 17)
    }
    
    func setTopDesCriptionLabel() {
        topDescriptionLabel.text = "By continuing you agree to our Terms"
        setSfFont(label: topDescriptionLabel, style: .light, size: 13)
        
        if let hasText = topDescriptionLabel.text {
            let attributedStr = NSMutableAttributedString(string: hasText)
            attributedStr.addAttribute(.foregroundColor, value: UIColor.blue, range: (hasText as NSString).range(of: "Terms"))
            
            topDescriptionLabel.attributedText = attributedStr
        }
        
    }
    
    func setMiddleLabel() {
        nameLabel.text = "Cardholder name"
        setSfFont(label: nameLabel, style: .semibold, size: 15)
        
        numberLabel.text = "Card Number"
        setSfFont(label: numberLabel, style: .semibold, size: 15)
        
        monthLabel.text = "Exp Month"
        setSfFont(label: monthLabel, style: .semibold, size: 15)
        
        yearLabel.text = "Exp Year"
        setSfFont(label: yearLabel, style: .semibold, size: 15)
        
        cvcLabel.text = "CVC"
        setSfFont(label: cvcLabel, style: .semibold, size: 15)
        
        cvcDescriptionLabel.text = "3 or 4 digits usually found on the signature strip"
        setSfFont(label: cvcDescriptionLabel, style: .regular, size: 11)
        cvcDescriptionLabel.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
    }
    
    
    //MARK: - text field
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    
    
    //MARK: set text field
    func setTextField(textField: UITextField) {
        let fontNameString = "SFProText-Light"
        let font = UIFont(name: fontNameString, size: 12)
        textField.font = font
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        textField.setLeftPaddingPoints(15)
        textField.setRightPaddingPoints(15)
    }
    
    func setTotalTextField() {
        setTextField(textField: nameTextField)
        setTextField(textField: numTextField)
        setTextField(textField: monthTextField)
        setTextField(textField: yearTextField)
        setTextField(textField: cvcTextField)
    }
    
    //MARK: 화면 터치로 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - pay ImageView
    @IBOutlet weak var paypalView: UIView!
    @IBOutlet weak var visaView: UIView!
    @IBOutlet weak var masterView: UIView!
    @IBOutlet weak var dinersView: UIView!
    @IBOutlet weak var amexView: UIView!
    
    //MARK: set pay Image
    func setPayImage() {
        makeBorderRound(view: paypalView, radius: 3.12)
        makeShadow(view: paypalView)
        setBorderFeature(view: paypalView)
        
        makeBorderRound(view: visaView, radius: 3.12)
        makeShadow(view: visaView)
        setBorderFeature(view: visaView)
        
        makeBorderRound(view: masterView, radius: 3.12)
        makeShadow(view: masterView)
        setBorderFeature(view: masterView)
        
        makeBorderRound(view: dinersView, radius: 3.12)
        makeShadow(view: dinersView)
        setBorderFeature(view: dinersView)
        
        makeBorderRound(view: amexView, radius: 3.12)
        makeShadow(view: amexView)
        setBorderFeature(view: amexView)
    }
    
    
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTopLabel()
        setTopDesCriptionLabel()
        setPayImage()
        setMiddleLabel()
        setTotalTextField()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
