//
//  ViewController.swift
//  uikit-codebase-ui
//
//  Created by 조주은 on 2022/10/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let yelloView = UIView()
        yelloView.backgroundColor = .yellow
        
//        yelloView.translatesAutoresizingMaskIntoConstraints = false     // 코드로 오토레이아웃을 구성하기 위한 설정
        
        self.view.addSubview(yelloView)
        
        yelloView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
//        NSLayoutConstraint.activate([
//            yelloView.widthAnchor.constraint(equalToConstant: 200),
//            yelloView.heightAnchor.constraint(equalToConstant: 200),
//            yelloView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            yelloView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
//        ])
//
//        // 크기
//        yelloView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        yelloView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        // 위치
//        yelloView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        yelloView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        
    }


}

#if DEBUG   // 전처리기

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable().ignoresSafeArea()
    }
}

#endif
