//
//  BaseViewController.swift
//  DaliyChallenge_20220820
//
//  Created by 조주은 on 2022/09/27.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: set sf-pro-text font
    func setSfFont(label: UILabel, style: fontMode, size: CGFloat){
        var fontNameString = "SFProText-Semibold"
        
        switch style {
        case .light:
            fontNameString = "SFProText-Light"
        case .regular:
            fontNameString = "SFProText-Regular"
        case .semibold:
            fontNameString = "SFProText-Semibold"
        }
        
        let font = UIFont(name: fontNameString, size: size)
        
        label.font = font
    }
    
    //MARK: set border round
    func makeBorderRound(view: UIView, radius: CGFloat) {
        view.clipsToBounds = false
        view.layer.cornerRadius = radius
    }
    
    //MARK: make Shadow
    func makeShadow(view: UIView) {
        view.layer.shadowColor = UIColor(red: 0.196, green: 0.196, blue: 0.278, alpha: 0.15).cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 6.25)
        view.layer.shadowRadius = 6.25
        view.layer.shadowOpacity = 1
    }
    
    // MARK: set border feature
    func setBorderFeature(view: UIView) {
        view.layer.borderWidth = 0.78
        view.layer.borderColor = UIColor(red: 0.894, green: 0.894, blue: 0.894, alpha: 0.6).cgColor
    }
    
    
}
