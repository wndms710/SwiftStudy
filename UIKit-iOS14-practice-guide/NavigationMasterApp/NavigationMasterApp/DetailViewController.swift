//
//  DetailViewController.swift
//  NavigationMasterApp
//
//  Created by 조주은 on 2022/09/27.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = .yellow
        self.statusBar?.backgroundColor = .yellow
    }

}

extension UIViewController {
    
    var statusBar: UIView? {
        // status bar design
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        
        if let hasStatusBar = sceneDelegate?.statusBarView {
            // 이렇게 하면 현재 뷰에서만 있음
//            self.view.addSubview(hasStatusBar)
            
            window?.addSubview(hasStatusBar)
        }
        
        return sceneDelegate?.statusBarView
    }

}
