//
//  ViewController.swift
//  PassData
//
//  Created by 조주은 on 2022/05/02.
//


// passing data (데이터를 넘겨주는 방법)
// 6가지

// 1. intance property
// 어디에 속해 있는 변수는 property라고 함


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

