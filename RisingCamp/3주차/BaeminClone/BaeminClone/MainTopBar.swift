//
//  MainOnTabBarViewController.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/23.
//

import UIKit
import Tabman
import Pageboy

class MainTopBar: TabmanViewController {
    
    @IBOutlet weak var tabView: UIView!
    
    // 탭바로 넘길 viewcontroller 선언
    private var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabMan()
    }
    
    private func setupTabMan() {
        let zeroVC = storyboard?.instantiateViewController(withIdentifier: "BaeminViewController") as! BaeminViewController
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "BaedalViewController") as! BaedalViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "PackagingViewController") as! PackagingViewController
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "BmartViewController") as! BmartViewController
        let fourthVC = storyboard?.instantiateViewController(withIdentifier: "StoreViewController") as! StoreViewController
        let fifthVC = storyboard?.instantiateViewController(withIdentifier: "ShopingViewController") as! ShopingViewController
        let sixthVC = storyboard?.instantiateViewController(withIdentifier: "GiftViewController") as! GiftViewController
        let seventhVC = storyboard?.instantiateViewController(withIdentifier: "NationViewController") as! NationViewController
        
        viewControllers.append(contentsOf: [zeroVC, firstVC, secondVC, thirdVC, fourthVC, fifthVC, sixthVC, seventhVC])
        
        
        // tab 상단바 생성 및 커스텀
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        // 배경 회색으로 나옴 -> 하얀색으로 바뀜
        bar.backgroundView.style = .blur(style: .light)
        // scroll mode
        bar.scrollMode = .swipe
        // 간격 설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        // 버튼 글씨 커스텀
        bar.buttons.customize { (button) in
            button.tintColor = UIColor(red: 159, green: 159, blue: 159, alpha: 1)
            button.selectedTintColor = .white
        }
        
        // 선택한 부분 민트색
        bar.indicator.weight = .medium
        bar.indicator.backgroundColor = UIColor(red: 94, green: 190, blue: 187, alpha: 1)
        
        // bar 경계 스크롤 할 때 그냥 두기
        bar.indicator.overscrollBehavior = .none
        
        // tabview에 bar 추가
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
}


extension MainTopBar: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "배민1")
        case 1:
            return TMBarItem(title: "배달")
        case 2:
            return TMBarItem(title: "포장")
        case 3:
            return TMBarItem(title: "B마트")
        case 4:
            return TMBarItem(title: "배민스토어")
        case 5:
            return TMBarItem(title: "쇼핑라이브")
        case 6:
            return TMBarItem(title: "선물하기")
        case 7:
            return TMBarItem(title: "전국별미")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
