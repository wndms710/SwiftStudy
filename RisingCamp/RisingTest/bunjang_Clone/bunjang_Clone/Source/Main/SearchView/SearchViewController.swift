//
//  SearchViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/26.
//

import UIKit

class SearchViewController: UIViewController {

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
        dismissKeyboardWhenTappedAround()
    }

//MARK: - properties
    @IBOutlet weak var textFieldView: UIView! {
        didSet {
            Constant().cornerCircle(textFieldView, 5)
        }
    }
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var follewView1: UIView! {
        didSet {
            Constant().cornerCircle(follewView1, 3)
        }
    }
    @IBOutlet weak var follewView2: UIView!{
        didSet {
            Constant().cornerCircle(follewView2, 3)
        }
    }
    @IBOutlet weak var follewView3: UIView!{
        didSet {
            Constant().cornerCircle(follewView3, 3)
        }
    }
    @IBOutlet weak var follewView4: UIView!{
        didSet {
            Constant().cornerCircle(follewView4, 3)
        }
    }
    @IBOutlet weak var follewView5: UIView!{
        didSet {
            Constant().cornerCircle(follewView5, 3)
        }
    }
    
    @IBOutlet weak var grayView: UIView! {
        didSet {
            Constant().cornerCircle(grayView, 5)
        }
    }

//MARK: - button
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func homeBut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
