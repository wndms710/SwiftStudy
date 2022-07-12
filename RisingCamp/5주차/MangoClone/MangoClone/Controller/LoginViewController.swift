//
//  LoginViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit
//import KakaoSDKCommon
//import KakaoSDKAuth
//import KakaoSDKUser
import FacebookLogin
import FBSDKLoginKit

class LoginViewController: UIViewController {
    //MARK: - properties
    @IBOutlet weak var facebookLogin: UIView! {
        didSet {
            let height = facebookLogin.frame.size.height
            facebookLogin.clipsToBounds = true
            facebookLogin.layer.cornerRadius = height / 2
        }
    }
    @IBOutlet weak var kakaoLogin: UIView! {
        didSet {
            let height = kakaoLogin.frame.size.height
            kakaoLogin.clipsToBounds = true
            kakaoLogin.layer.cornerRadius = height / 2
        }
    }
    @IBOutlet weak var appleLogin: UIView! {
        didSet {
            let height = appleLogin.frame.size.height
            appleLogin.clipsToBounds = true
            appleLogin.layer.cornerRadius = height / 2
        }
    }
    @IBOutlet weak var emailLogin: UIView! {
        didSet {
            let height = emailLogin.frame.size.height
            emailLogin.clipsToBounds = true
            emailLogin.layer.cornerRadius = height / 2
        }
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: - Login
    @IBAction func tapKakao(_ sender: Any) {
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoAccount() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
    }
    
    @IBAction func tapFacebookLogin(_ sender: Any) {
        let loginManager = LoginManager()
        
        if let _ = AccessToken.current {
            loginManager.logOut()
        }
        else {
            loginManager.logIn(permissions: ["public_profile", "email"], from: self) { [weak self] (result, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let result = result, !result.isCancelled else {
                    print("User cancelled login")
                    return
                }
                GraphRequest.init(graphPath: "me", parameters: ["fields" : "id, name, email"]).start(completion: {(connection, result, error) -> Void in
                print("error: ", error ?? "No Error")
                guard let facebook = result as? [String: AnyObject] else { return }
                                                                                                     
                let token = facebook["id"] as? String
                let name = facebook["name"] as? String
                let email = facebook["email"] as? String
                print("token: ",token ?? "no Token")
                print("name: ", name ?? "no Name")
                print("email: ", email ?? "no Email")
                
                })
                
                let locationVC = self?.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
                locationVC.modalPresentationStyle = .overCurrentContext
                self?.present(locationVC, animated: true)
                                                                                                     
            }
        }
        
    }

}
