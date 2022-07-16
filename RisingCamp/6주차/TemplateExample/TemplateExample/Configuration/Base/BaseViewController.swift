//
//  BaseViewController.swift
//  TemplateExample
//
//  Created by 조주은 on 2022/07/15.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.NotoSans(.medium, size: 16)]
        
        // Background Color
        self.view.backgroundColor = .yellow
    }
}
