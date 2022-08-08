//
//  SelfLogInViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/19.
//

import UIKit
import TweeTextField
import MaterialComponents.MaterialBottomSheet

class SelfLogInViewController: BaseViewController, UIScrollViewDelegate, UITextFieldDelegate, TongViewControllerDelegate  {
    
    
    //MARK: - lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView!.delegate = self
//        birthTextField.delegate = self
        
        //MARK: 키보드 위 툴바
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: okBut.frame.height)

        let nextBut = UIButton.init(type: .custom)
        nextBut.setTitle("다음", for: .normal)
        nextBut.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nextBut.setTitleColor(.white, for: .normal)
        nextBut.backgroundColor = Constant().mainColor
        
        toolBar.isUserInteractionEnabled = false
        toolBar.alpha = 0.3
        
        nextBut.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        
        nameTextField.addTarget(self, action: #selector(userIsEditing), for: .editingChanged)

        nextBut.frame = CGRect(x: 0, y: 0, width: toolBar.frame.width, height: toolBar.frame.height)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        let barNextBut = UIBarButtonItem.init(customView: nextBut)
        toolBar.items = [space, barNextBut, space]

        nameTextField.inputAccessoryView = toolBar

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // scroll view 특정 위치
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height), animated: false)
        backGroundView.isHidden = true
        nameTextField.becomeFirstResponder()
    }
    

//MARK: - properties
    
    @IBOutlet weak var backGroundView: UIView! {
        didSet {
            backGroundView.isHidden = false
        }
    }
    
    @IBAction func tapBackBut(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //MARK: ok button
    @IBOutlet weak var okBut: UIButton! {
        didSet {
            Constant().cornerCircle(okBut, 5)
//            okBut.title(for:)
//            okBut.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            okBut.isHidden = true
        }
    }
    
    @IBAction func tapOKBut(_ sender: Any) {
        registUserInfo()
        MessgaeRequest().sendSMS(self)
    }
    
    func didSuccess(_ response: MessageResponse) {
        if response.isSuccess == true {
            let vc = storyboard?.instantiateViewController(withIdentifier: "NumberViewController") as! NumberViewController
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        else {
            print("error")
        }
    }

    
        //MARK: scroll
    @IBOutlet weak var contentView: UIView!
    // height = * 0.45
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    //MARK: - api
    func registUserInfo() {
        if let name = nameTextField.text {
            LogInUserInfo.userName = name
        }
        if let birth = birthTextField.text {
            LogInUserInfo.birthdate = birth
        }
        if let personalNum = secretTextField.text {
            LogInUserInfo.firstNumber = personalNum
        }
        if let mobileCarrier = sktTextField.text {
            LogInUserInfo.newsAgency = mobileCarrier
        }
        if let phoneNumber = numberTextField.text {
            LogInUserInfo.phone = phoneNumber
        }
    }

    
    //MARK: - scroll되는 함수
    func stepScroll() {
        if scrollView.contentOffset.y > 0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - (scrollView.frame.height / 4)), animated: true)
        }
    }
    @IBOutlet weak var changeLabel: UILabel! {
        didSet {
            changeLabel.text = "이름을\n입력해주세요"
        }
    }
    

    //MARK: - name 텍스트 필드
    @IBOutlet weak var nameTextField: TweeActiveTextField! {
        didSet {
            nameTextField.tintColor = .black
            nameTextField.animationDuration = 0.1
        }
    }
    
    //MARK: 키보드 위 다음 버튼 눌렀을 때
    @objc func tapNextButton() {
        nameTextField.resignFirstResponder()
        nameTextField.inputAccessoryView?.isHidden = true
        changeLabel.text = "생년월일을\n입력해주세요"
        stepScroll()
        birthTextField.becomeFirstResponder()
    }
    //MARK: 글자를 입력했을 때만 버튼 활성화
    @objc func userIsEditing(_ sender: UITextField) {
        if let toolbar = nameTextField.inputAccessoryView {
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

    
    //MARK: - 생년월일
    @IBOutlet weak var birthTextField: TweeActiveTextField! {
        didSet {
            birthTextField.addTarget(self, action: #selector(birthIsDone), for: .editingChanged)
        }
    }
    
    //MARK: 6글자 쓰면 다음으로 넘어가는 함수
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let currentText = textField.text ?? ""
//        guard let stringRange = Range(range, in: currentText) else { return false }
//
//        let changedText = currentText.replacingCharacters(in: stringRange, with: string)
//        return changedText.count <= 6
//    }
    
    @objc func birthIsDone(_ sender: UITextField) {
        if sender.text?.count == 6 {
            sender.resignFirstResponder()
            secretTextField.becomeFirstResponder()
        }
    }
    
    
    //MARK: - 주민번호 뒷자리
    @IBOutlet weak var secretTextField: TweeActiveTextField! {
        didSet {
            secretTextField.addTarget(self, action: #selector(secretIsDone), for: .editingChanged)
        }
    }
    
    @objc func secretIsDone(_ sender: UITextField) {
        if sender.text?.count == 1 {
            sender.resignFirstResponder()
            changeLabel.text = "통신사를\n선택해주세요"
            stepScroll()
            sktTextField.becomeFirstResponder()
            showBottomSheet()
        }
    }
    
    //MARK: - 통신사
    @IBOutlet weak var sktTextField: TweeActiveTextField!
    
    let list = ["", "SKT", "KT", "LG U+", "SKT 알뜰폰", "KT 알뜰폰", "LG U+ 알뜰폰"]
    var myTag: Int = 0
    
    @IBAction func tapTong(_ sender: Any) {
        showBottomSheet()
    }
    
    func sendTag(_ tag: Int) {
        self.myTag = tag
        sktTextField.text = list[myTag]
        stepScroll()
        if let number = numberTextField.text {
            if number.isExists == false {
                numberTextField.becomeFirstResponder()
                changeLabel.text = "휴대폰번호를\n입력해주세요"
            }
        } else { return }
    }
 
    func showBottomSheet() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TongViewController") as! TongViewController
        vc.delegate = self
        vc.myTag = self.myTag

        let bottomVC: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomVC.mdc_bottomSheetPresentationController?.preferredSheetHeight = view.frame.height * 0.45
        Constant().cornerCircle(bottomVC.view, 20)
        present(bottomVC, animated: true)
    }
    
    //MARK: - 전화번호
    @IBOutlet weak var numberTextField: TweeActiveTextField! {
        didSet {
            numberTextField.addTarget(self, action: #selector(numberFunction), for: .editingChanged)
        }
    }
    
    @objc func numberFunction(_ sender: UITextField) {
//        if let text = sender.text {
//            if text.count >= 11 {
//            sender.resignFirstResponder()
//            changeLabel.text = "입력한 정보를\n확인해주세요"
//            }
//        }
        if sender.text?.count ?? 0 >= 11 {
            if sender.text?.count ?? 0 > 11 {
                sender.text?.removeLast()
            }
            sender.resignFirstResponder()
            changeLabel.text = "입력한 정보를\n확인해주세요"
            
            okBut.isHidden = false
            dismissKeyboardWhenTappedAround()
        }
    }
    
    
}
