//
//  HomePagingViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import UIKit
import Tabman
import Pageboy

class HomePagingViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "RecommandViewController") as! RecommandViewController
        let vc2 = BrandViewController(nibName: "BrandViewController", bundle: nil)
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        
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
        }
        
        bar.indicator.overscrollBehavior = .none
        bar.indicator.weight = .medium
        bar.indicator.tintColor = .black
        
        addBar(bar, dataSource: self, at: .top)
    }
}

extension HomePagingViewController: PageboyViewControllerDataSource, TMBarDataSource {
 
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
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
            return TMBarItem(title: "추천상품")
        case 1:
            return TMBarItem(title: "브랜드🌝")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        self.view.sizeToFit()
    }
    

}
