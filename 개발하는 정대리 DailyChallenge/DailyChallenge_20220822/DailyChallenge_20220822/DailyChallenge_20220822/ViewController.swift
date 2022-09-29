//
//  ViewController.swift
//  DailyChallenge_20220822
//
//  Created by 조주은 on 2022/09/29.
//

import UIKit
import MaterialComponents.MaterialBottomSheet


class ViewController: UIViewController {
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomSheet()
    }
    
    
    // MARK: - show bottom sheet
    func showBottomSheet() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
        vc.view.clipsToBounds = false
        vc.view.layer.cornerRadius = 20
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = self.view.bounds.size.height * 0.35
                
        self.present(bottomSheet, animated: true)
        
    }

    @IBAction func showBut(_ sender: Any) {
        showBottomSheet()
    }
    
}
