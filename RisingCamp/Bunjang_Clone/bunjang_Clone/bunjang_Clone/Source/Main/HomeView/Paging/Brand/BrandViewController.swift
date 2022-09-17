//
//  BrandViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//


import UIKit
import XLPagerTabStrip

class BrandViewController: BaseViewController, IndicatorInfoProvider  {
    var childName: String = ""
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: childName)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

