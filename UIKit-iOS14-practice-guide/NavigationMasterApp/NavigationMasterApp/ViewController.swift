//
//  ViewController.swift
//  NavigationMasterApp
//
//  Created by 조주은 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviTitleImage()
        
        makeBackButton()
    }
    
    func makeBackButton() {
        
//        var backImage = UIImage(systemName: "backward.fill")
//        backImage = backImage?.withRenderingMode(.alwaysOriginal)
        
        // 이미지 눌러서 도구로 직접 크기 조절
        // @3x는 적지 않음
//        let backImage = UIImage(named: "newBackButton")?.withRenderingMode(.alwaysOriginal)    // 나중에 변경 사항이 적용 안됨
        // default는 .alwaysTemplete
        
        
        // 코드로 직접 크기 조절
        guard let backImage = UIImage(named: "backButtonImg")?.withRenderingMode(.alwaysOriginal) else {
            return
        }
        
        let newImage = resizeImage(image: backImage, newWidth: 40, newHeight: 40)
       
        // 두개 다 넣어야지 바뀜
        self.navigationController?.navigationBar.backIndicatorImage = newImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
        
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        
        self.navigationItem.backButtonTitle = ""
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {

        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)    // Rect는 크기와 위치에 대한 개념
        // 40&40 도화지에 꽉 채워서 넣으려면 x, y에 0, 여백 주려면 증가시키기
        
        // 새로운 도화지를 만들겠다
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight)) // 해당 크기의 빈 도화지 만들기
        // 빈 도화지 위에 이미지 올리기
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        // 그리기 끝
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func setNaviTitleImage() {
        //        self.navigationItem.title = "main view"
                
        //        let logo = UIImageView(image: UIImage(named: "logoSample.png"))
        //
        //        logo.contentMode = .scaleAspectFit
        //        logo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //
        //        navigationItem.titleView = logo
                
                
                let btn = UIButton()
        //        btn.backgroundColor = .orange
                btn.setTitleColor(.blue, for: .normal)
                btn.setTitle("custom button", for: .normal)
                btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
                btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
                btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
                self.navigationItem.titleView = btn
    }
    
    @objc func testAction() {
        print("test action")
    }
    



}

