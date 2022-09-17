//
//  ViewController.swift
//  PanGestureApp
//
//  Created by 조주은 on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = DraggableView()
        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.backgroundColor = .red
        
        self.view.addSubview(myView)
    }


}


