//
//  StoreNameViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/21.
//
// 10글자 쓰고 중간에 바꾸면 맨 뒤에 지워지는 거 바꾸기

import UIKit
import TweeTextField

class StoreNameViewController: BaseViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        storeNameTextField.delegate = self
        
        super.viewDidLoad()
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.055)

        let nextBut = UIButton.init(type: .custom)
        nextBut.setTitle("확인", for: .normal)
        nextBut.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nextBut.setTitleColor(.white, for: .normal)
        nextBut.backgroundColor = Constant().mainColor
        
        toolBar.isUserInteractionEnabled = false
        toolBar.alpha = 0.3
        
        nextBut.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        
        storeNameTextField.addTarget(self, action: #selector(userIsEditing), for: .editingChanged)
        storeNameTextField.addTarget(self, action: #selector(maxTen), for: .editingChanged)

        nextBut.frame = CGRect(x: 0, y: 0, width: toolBar.frame.width, height: toolBar.frame.height)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        let barNextBut = UIBarButtonItem.init(customView: nextBut)
        toolBar.items = [space, barNextBut, space]

        storeNameTextField.inputAccessoryView = toolBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        storeNameTextField.becomeFirstResponder()
    }
    
    
    //MARK: - Store naem text field
    @IBOutlet weak var storeNameTextField: TweeActiveTextField!
    
    //MARK: - API
    func updateValue() {
        if let text = self.storeNameTextField.text {
            LogInUserInfo.storeName = text
        }
    }
    
    func didSuccess(_ response: SelfResponse) {
        if response.isSuccess == true {
            print("회원가입 성공 >> \(response.result!)")
            if let result = response.result {
                Constant.userIdx = result.userIdx
                Secret.jwt = result.jwt
            }
            Secret.storeName = storeNameTextField.text ?? "오공"
            dismissIndicator()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SNSViewController") as! SNSViewController
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message)
        }
    }
    
    //MARK: 키보드 위 다음 버튼 눌렀을 때
    @objc func tapNextButton() {
        updateValue()
        showIndicator()
        SelfSignupRequest().selfSignUp(self)
    }
    
    //MARK: 글자를 입력했을 때만 버튼 활성화
    @objc func userIsEditing(_ sender: UITextField) {
        if let toolbar = storeNameTextField.inputAccessoryView {
            if sender.text?.isEmpty == true {
                toolbar.isUserInteractionEnabled = false
                toolbar.alpha = 0.3
            }
            else {
                toolbar.isUserInteractionEnabled = true
                toolbar.alpha = 1
            }
        } else {
            return print("none toolbar")
        }
    }
    
    //MARK: 특수 문자 제거 함수
    
    // 이거는 한글도 안써져서 버림
//    @objc func removeSpecial(_ sender: UITextField) {
//        sender.text = self.removeSpecialChars(text: sender.text ?? "")
//    }
    
//    func removeSpecialChars(text: String) -> String {
//        let okayChars : Set<Character> = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
//
//        return String(text.filter {okayChars.contains($0) })
//    }
//
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let utf8Char = string.cString(using: .utf8)
            let isBackSpace = strcmp(utf8Char, "\\b")
            if string.hasCharacters() || isBackSpace == -92 {
                return true
            }
            return false
        }
    
    
    //MARK: 10글자 제한
    @objc func maxTen(_ sender: UITextField) -> Bool {
        if sender.text?.count ?? 0 > 10 {
            sender.text?.removeLast()
            sender.resignFirstResponder()
            return false
        }
        return true
    }

}
