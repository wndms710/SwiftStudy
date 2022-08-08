//
//  NumberViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/21.
//

import UIKit
import TweeTextField

class NumberViewController: BaseViewController {

    //MARK: LifeCycle
    override func viewDidLoad() {
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
        
        numTextField.addTarget(self, action: #selector(userIsEditing), for: .editingChanged)
        numTextField.addTarget(self, action: #selector(isSix), for: .editingChanged)

        nextBut.frame = CGRect(x: 0, y: 0, width: toolBar.frame.width, height: toolBar.frame.height)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        let barNextBut = UIBarButtonItem.init(customView: nextBut)
        toolBar.items = [space, barNextBut, space]

        numTextField.inputAccessoryView = toolBar
        
        startTimer()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        numTextField.becomeFirstResponder()
    }
    
    
    //MARK: - properties
    @IBOutlet weak var phoneNum: UILabel! {
        didSet {
            phoneNum.text = LogInUserInfo.phone
        }
    }
    @IBOutlet weak var stateHolder: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //MARK: - api
    
    var authNumber: String = ""

    func updateUserInfo() {
        if let authNumber = numTextField.text {
            LogInUserInfo.authNumber = authNumber
        }
    }
    
    func didSuccess(_ response: MessageCheckResponse) {
        if response.isSuccess == true {
            SelfLoginRequest().selfLogin(self)
            ConfirmUserRequest().confirmUser(self)
        } else {
            stateHolder.text = response.message
            stateHolder.textColor = Constant().mainColor
            numTextField.activeLineColor = Constant().mainColor
        }
    }
    
    func confirmUser(_ response: ConfirmUserResponse) {
        if response.result == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreNameViewController") as! StoreNameViewController
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
        else {
            
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let navigatioinVC = mainStory.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
            changeRootViewController(navigatioinVC)
        }
    }
    
    func selfLogin(_ response: SelfResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                Secret.jwt = result.jwt
                Constant.userIdx = result.userIdx
            }
            print("로그인 성공 >> \(response.result!)")
        }
    }

    //MARK: - text field
    @IBOutlet weak var numTextField: TweeActiveTextField!
    
    //MARK: 키보드 위 다음 버튼 눌렀을 때
    @objc func tapNextButton(_ sender: UIButton) {
        updateUserInfo()
        MessageCheckRequest().messageCheck(self)
    }
    
    //MARK: 글자를 입력했을 때만 버튼 활성화
    @objc func userIsEditing(_ sender: UITextField) {
        if let toolbar = numTextField.inputAccessoryView {
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
    
    @objc func isSix(_ sender: UITextField) {
        if sender.text?.count ?? 0 >= 6 {
            if sender.text?.count ?? 0 > 6 {
                sender.text?.removeLast()
            }
        }
    }
    
    //MARK: - timer
    var timer: DispatchSourceTimer?
    var currentSeconds = 180
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
                
                if self.currentSeconds <= 0 {
                    MessageTimeOutRequest().messageTimeOut(self)
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.text = "00:00"
            self.endView.isUserInteractionEnabled = true
            self.endView.alpha = 1
            self.numTextField.inputAccessoryView?.isUserInteractionEnabled = false
            self.numTextField.inputAccessoryView?.alpha = 0.3
        })
        self.timer?.cancel()
        self.timer = nil
    }
    
    
    //MARK: - 만료 표시
    @IBOutlet weak var endView: UIView! {
        didSet {
            endView.isUserInteractionEnabled = false
            endView.alpha = 0
        }
    }
    
    //MARK: - 뒤로가기 버튼
    @IBAction func backBut(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
}
