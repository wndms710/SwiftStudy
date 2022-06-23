//
//  ViewController.swift
//  Week3Practice
//
//  Created by 조주은 on 2022/06/23.
//

import UIKit


class ViewController: UIViewController {
  
    @IBOutlet weak var uiFriendList: UITableView!
    
    var friendList : [FriendData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        friendList.append(FriendData("오공", "hi"))
        friendList.append(FriendData("금돌", "냠냠"))
        friendList.append(FriendData("금설", "설사"))
        
        // tableview의 delegate는 앞으로 내가 가져가겠다.
        // 원래 uiFriendList가 수행했어야 하는 것을 VC가 수행
        uiFriendList.delegate = self
        uiFriendList.dataSource = self
        
        // tableview에 사용할 cell 등록
        let friendCell = UINib(nibName: "FriendTableViewCell", bundle: nil)
        self.uiFriendList.register(friendCell, forCellReuseIdentifier: "FriendCell")
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 데이터 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    // cell을 어떻게 엮어줄 것인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell을 갖고오는 것
        // 안전하게 갖고옴, nil이면 그냥 UITableViewCell을 cell에 넣어라
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else {
            
            return UITableViewCell()
        }
        
        // indexPath는 보일 때 호출
        print(indexPath.row)
        
        // 데이터 가져오기
        let friendData: FriendData = friendList[indexPath.row]
        
        cell.uiName.text = friendData.name
        cell.uiProfileMessage.text = friendData.profileMessage
        
        return cell
    }
    
    
}
