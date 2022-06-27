//
//  OrderViewController.swift
//  starbucksAppClone
//
//  Created by 조주은 on 2022/06/16.
//

import UIKit

class OrderViewController: UIViewController {
    
    let text: String = "위치 정보의 보호 및 이용 등에 관한 법률에 따라 현재 위치 확인, 주변 매장 찾기, 사이렌 오더 서비스가 포함된 본 애플리케이션의 이용을 위해서는 위치 기반 서비스 이용 약관 동의가 필요합니다. 동의하지 않는 경우 위치 기반 서비스 이용에 제약을 받을 수 있습니다."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Order"
        
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.backButtonTitle = nil
        self.navigationItem.backBarButtonItem?.tintColor = .darkGray
        
    }

    @IBAction func tapBottomView(_ sender: Any) {
        showAlert(message: text)
    }
    

    
//    @IBAction func tapRecommandImage(_ sender: Any) {
//        let recommandVC = self.storyboard?.instantiateViewController(withIdentifier: "RecommandViewController") as! RecommandViewController
//
//        self.navigationController?.pushViewController(recommandVC, animated: true)
//
//    }
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "위치 정보 서비스 이용약관 동의", message: message, preferredStyle: .alert)

        let agreeNegative = UIAlertAction(title: "동의 거부", style: .default) { _ in
            self.dismiss(animated: true)
        }
        let agreePostive = UIAlertAction(title: "약관 동의", style: .default) { _ in
            self.dismiss(animated: true)
        }

        alert.addAction(agreeNegative)
        alert.addAction(agreePostive)

        present(alert, animated: true)
    }

}
