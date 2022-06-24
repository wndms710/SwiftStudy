//
//  BaeminViewController.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/23.
//

import UIKit

class BaeminViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let topCell = UINib(nibName: "TopBannerTableViewCell", bundle: nil)
        let middleCell = UINib(nibName: "MiddleMenuTableViewCell", bundle: nil)
        let snsCell = UINib(nibName: "SnsGoodTableViewCell", bundle: nil)
        
        tableView.register(topCell, forCellReuseIdentifier: "TopBannerTableViewCell")
        tableView.register(middleCell, forCellReuseIdentifier: "MiddleMenuTableViewCell")
        tableView.register(snsCell, forCellReuseIdentifier: "SnsGoodTableViewCell")
        
    }


}

extension BaeminViewController: UITableViewDelegate, UITableViewDataSource {
    
    // section 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topCell = tableView.dequeueReusableCell(withIdentifier: "TopBannerTableViewCell", for: indexPath) as! TopBannerTableViewCell
        let middleCell = tableView.dequeueReusableCell(withIdentifier: "MiddleMenuTableViewCell", for: indexPath) as! MiddleMenuTableViewCell
        let snsCell = tableView.dequeueReusableCell(withIdentifier: "SnsGoodTableViewCell", for: indexPath) as! SnsGoodTableViewCell
        
        if indexPath.row == 0 {
            return topCell
        } else if indexPath.row == 1 {
            return middleCell
        } else if indexPath.row == 2 {
            return snsCell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    
}
