//
//  HomeCategoryTabmanViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit
import Tabman
import Pageboy

class HomeCategoryTabmanViewController: TabmanViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        let vc2 = HomeBrandViewController()
        let vc3 = ServiceViewController()
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
        self.dataSource = self

        
        // paging bar custom
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        bar.backgroundView.style = .clear
        bar.backgroundColor = .white
        
        bar.buttons.customize { (button) in
            button.tintColor = Constant().middleGreyColor
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        }
        
        bar.indicator.overscrollBehavior = .none
        bar.indicator.weight = .light
        bar.indicator.tintColor = .black
        
        addBar(bar, dataSource: self, at: .top)
    }
    
    private var viewControllers: Array<UIViewController> = []

}


extension HomeCategoryTabmanViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 3
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "카테고리")
        case 1:
            return TMBarItem(title: "브랜드")
        case 2:
            return TMBarItem(title: "서비스")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    
}
