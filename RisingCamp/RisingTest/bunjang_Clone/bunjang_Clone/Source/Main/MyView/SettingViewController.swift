//
//  SettingViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: - properties
    @IBOutlet weak var tableView: UITableView!
    let list1 = ["계정 설정", "알림 설정", "우리동네 지역 설정", "배송지 설정", "계좌 설정", "간편결제 카드설정", "차단 상점 관리"]
    let list2 = ["이용약관", "개인정보 처리방침", "위치기반 서비스 이용약관", "버전정보 8.10.1"]
    let list3 = ["로그아웃 (jucho710)"]
        
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: - back button
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return list1.count
        } else if section == 1 {
            return list2.count
        } else if section == 2 {
            return list3.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        if indexPath.section == 0 {
            cell.name.text = list1[indexPath.row]
            return cell
        }
        else if indexPath.section == 1 {
            cell.name.text = list2[indexPath.row]
            return cell
        }
        else if indexPath.section == 2 {
            cell.name.text = list3[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "사용자 설정"
        }
        else if section == 1 {
            return "서비스 정보"
        }
        else {
            return " "
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 16
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 35
        }
        else if section == 1 {
            return 35
        } else {
            return 10
        }
    }

}
