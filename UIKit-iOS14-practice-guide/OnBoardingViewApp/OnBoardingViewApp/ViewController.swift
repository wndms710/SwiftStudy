//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by 조주은 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    var didShowOnboardingView = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if didShowOnboardingView == false {
            didShowOnboardingView = true
            
            let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            
            // pageVC.transitionStyle = .scroll
            // Cannot assign to property: 'transitionStyle' is a get-only property
            // -> get-only는 생성되고 난 후 바꿀 수 없는 개념, 처음에 생성될 때 바꿔야 함
            
            pageVC.modalPresentationStyle = .fullScreen
            
            self.present(pageVC, animated: true)
        }
        
    }


}

