//
//  BeforeSignViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/19.
//

import UIKit
import ImageSlideshow
import MaterialComponents.MaterialBottomSheet
import TweeTextField

class BeforeSignViewController: BaseViewController {
    
    //MARK: - properties
    @IBOutlet weak var kakaoView: UIView! {
        didSet {
            Constant().cornerCircle(kakaoView, kakaoView.frame.height / 2)
        }
    }
    @IBOutlet weak var appleView: UIView! {
        didSet {
            Constant().cornerCircle(appleView, appleView.frame.height / 2)
            Constant().makeBorder(appleView, 1.0, UIColor.black.cgColor)
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var slideShow: ImageSlideshow! {
        didSet {
            slideShow.setImageInputs([
                ImageSource(image: UIImage(named: "first1")!),
                ImageSource(image: UIImage(named: "first2")!),
                ImageSource(image: UIImage(named: "first3")!),
                ImageSource(image: UIImage(named: "first4")!)
            ])
            
            slideShow.pageIndicator = self.pageControl
            slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
        }
    }
    
    
    
    
    //MARK: - 다른 방법으로 로그인 버튼
    @IBAction func anotherLogin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MeLogInViewController") as! MeLogInViewController
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = view.frame.height * 0.33
        Constant().cornerCircle(bottomSheet.view, 20)
        
        present(bottomSheet, animated: true)
    }
    

    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
