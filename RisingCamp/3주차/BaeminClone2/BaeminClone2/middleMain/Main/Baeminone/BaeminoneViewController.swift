//
//  BaeminoneViewController.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/26.
//

import UIKit

class BaeminoneViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var storeDataList: [StoreData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        storeDataList.append(StoreData("store1", "꽉찬소곱창 연신내점", "4.9", "17~27분", "24,000원", "3,000원", "1.2km"))
        storeDataList.append(StoreData("store2", "30년 불멸의 닭발", "5.0", "16~26분", "5,000원", "무료", "1.2km"))
        storeDataList.append(StoreData("store3", "매우당매운갈비찜", "5.0", "18~28분", "14,000원", "1,900원~2,500원", "0.7km"))
        storeDataList.append(StoreData("store4", "구구족 연신내점", "4.9", "17~27분", "25,000원", "1,900원", "0.5km"))
        storeDataList.append(StoreData("store5", "부산아지매국밥 연신내점", "4.7", "17~27분", "12,000원", "2,500원", "0.5km"))
        storeDataList.append(StoreData("store6", "짜글이용사 성공담", "4.9", "18~28분", "8,000원", "0원~3,000원", "0.6km"))

        
        let bannerCell = UINib(nibName: "TopBannerTableViewCell", bundle: nil)
        tableView.register(bannerCell, forCellReuseIdentifier: "TopBannerTableViewCell")
        
        let middelCell = UINib(nibName: "MiddelMenuTableViewCell", bundle: nil)
        tableView.register(middelCell, forCellReuseIdentifier: "MiddelMenuTableViewCell")
        
        let snsCell = UINib(nibName: "SnsgoodTableViewCell", bundle: nil)
        tableView.register(snsCell, forCellReuseIdentifier: "SnsgoodTableViewCell")
        
        let storeCell = UINib(nibName: "StoreTableViewCell", bundle: nil)
        tableView.register(storeCell, forCellReuseIdentifier: "StoreTableViewCell")
    }

}

extension BaeminoneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopBannerTableViewCell", for: indexPath) as! TopBannerTableViewCell
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MiddelMenuTableViewCell", for: indexPath) as! MiddelMenuTableViewCell
            return cell
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SnsgoodTableViewCell", for: indexPath) as! SnsgoodTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
            
            let storeData: StoreData = storeDataList[indexPath.row]
            
            cell.imgView.image = storeData.image
            cell.name.text = storeData.storeName
            cell.grade.text = storeData.grade
            cell.time.text = storeData.time
            cell.minimun.text = storeData.minimum
            cell.tip.text = storeData.tip
            cell.distance.text = storeData.distance
            
            return cell
        }
    }
    
    // header view 없애기
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
}

// cell 크기
extension BaeminoneViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.frame.size.height * 0.23
        }
        else if indexPath.row == 1 {
            return tableView.frame.size.height * 0.4
        }
        else if indexPath.row == 2 {
            return tableView.frame.size.height * 0.47
        }
        else {
            return tableView.frame.size.height * 0.4
        }
    }
}
