//
//  OnBoardingItemViewController.swift
//  OnBoardingViewApp
//
//  Created by 조주은 on 2022/09/18.
//

import UIKit

class OnBoardingItemViewController: UIViewController {
    
    var mainText = ""
    var subText = ""
    var topImage: UIImage? = UIImage()
    
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTitleLabel.text = mainText
        descriptionLabel.text = subText
        topImageView.image = topImage
        
    }


}
