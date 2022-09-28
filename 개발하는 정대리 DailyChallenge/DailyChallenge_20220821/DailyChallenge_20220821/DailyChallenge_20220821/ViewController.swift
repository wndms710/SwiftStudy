//
//  ViewController.swift
//  DailyChallenge_20220821
//
//  Created by 조주은 on 2022/09/28.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class ViewController: UIViewController {
    
    //MARK: - Navigation properties
    
    @IBOutlet weak var navigationTitleLabel: UILabel! {
        didSet {
            navigationTitleLabel.text = "Order Summary"
        }
    }
    @IBOutlet weak var navigationBackButton: UIButton! {
        didSet {
            navigationBackButton.tintColor = UIColor(red: 0.329, green: 0.694, blue: 0.459, alpha: 1)
        }
    }
    

    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentBottomSheet()
    }
    
    //MARK: - present bottom sheet
    func presentBottomSheet() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
        vc.view.setViewCornerRadius(radius: 20)
                
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = self.view.frame.size.height * 0.6
//        bottomSheet.view.setViewCornerRadius(radius: 20)
        bottomSheet.scrimColor = UIColor.clear
        
        present(bottomSheet, animated: true)
    }
    
    //MARK: open bot sheet but
    @IBAction func openBut(_ sender: Any) {
        presentBottomSheet()
    }
    
    //MARK: - Set status bar
    func setStatusBar() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
//        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        
        if let hasStatusBar = sceneDelegate?.statusBarView {
            hasStatusBar.backgroundColor = .white
//            window?.addSubview(hasStatusBar)
            self.view.addSubview(hasStatusBar)
        }
    }
    
    
}

