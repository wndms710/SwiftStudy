//
//  ViewController.swift
//  tableViewBug
//
//  Created by 조주은 on 2022/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList: [myData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataList.append(myData("오공", profileText: "냠냠"))
        dataList.append(myData("금돌", profileText: "왈왈"))
        dataList.append(myData("금설", profileText: "멍멍"))
        dataList.append(myData("주은", profileText: "메롱"))
        dataList.append(myData("오공", profileText: "냠냠"))
        dataList.append(myData("금돌", profileText: "왈왈"))
        dataList.append(myData("금설", profileText: "멍멍"))
        dataList.append(myData("주은", profileText: "메롱"))
        dataList.append(myData("오공", profileText: "냠냠"))
        dataList.append(myData("금돌", profileText: "왈왈"))
        dataList.append(myData("금설", profileText: "멍멍"))
        dataList.append(myData("주은", profileText: "메롱"))
        dataList.append(myData("오공", profileText: "냠냠"))
        dataList.append(myData("금돌", profileText: "왈왈"))
        dataList.append(myData("금설", profileText: "멍멍"))
        dataList.append(myData("주은", profileText: "메롱"))
        dataList.append(myData("오공", profileText: "냠냠"))
        dataList.append(myData("금돌", profileText: "왈왈"))
        dataList.append(myData("금설", profileText: "멍멍"))
        dataList.append(myData("주은", profileText: "메롱"))
        dataList.append(myData("오공", profileText: "냠냠"))
        dataList.append(myData("금돌", profileText: "왈왈"))
        dataList.append(myData("금설", profileText: "멍멍"))
        dataList.append(myData("주은", profileText: "메롱"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "TableViewCell")
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let data: myData = dataList[indexPath.row]
        
        cell.name.text = data.name
        cell.profileText.text = data.profileText
        

        
        return cell
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
