//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by 조주은 on 2022/05/25.
//

import UIKit

class ViewController: UIViewController {
    
    var settingModel = [[SettingModel]]()  // SettingModel로 구성된 배열이 들어가는 배열
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append(
            [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store, and more.", rightImageName: nil)]
        )
        
        settingModel.append(
            [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
            
        )
    }
    
    // 화면이 나올 때마다 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    // 메모리 해제가 안 되면 한 번 호출하고 끝
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        makeData()
        
        title = "Settings"
        self.view.backgroundColor = UIColor(white: 245/255, alpha: 1)
    
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Cell 개수
//        return 5
        // 섹션 안 row 개수에 따라
        return settingModel[section].count
    }
    
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    // General 눌렀을 때 스토리보드 가져오기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            // name 이름의 스토리보드에서 해당 ID값을 가지는 view controller를 가져와라
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(withIdentifier: "GeneralViewController") as? GeneralViewController {
                self.navigationController?.pushViewController(generalVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell     // 강제 type casting
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = .red
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
        return cell
    }
    
    // cell 높이 지정 1번
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // 높이
//        return 80
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 첫 번째는 자동
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        // 나머지는 60
        return 60
    }
    
}


