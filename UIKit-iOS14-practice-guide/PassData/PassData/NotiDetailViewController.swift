//
//  NotiDetailViewController.swift
//  PassData
//
//  Created by 조주은 on 2022/05/24.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notiAction(_ sender: Any) {
        
        let notificatilnName = Notification.Name("sendSomeString")
        
        let strDic = ["str" : "noti string"]
        
        // notification 이름으로 호출
        NotificationCenter.default.post(name: notificatilnName, object: nil, userInfo: strDic)
        
        self.dismiss(animated: true, completion: nil)
    }

    
}
