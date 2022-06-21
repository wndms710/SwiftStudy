//
//  ViewController.swift
//  project2
//
//  Created by 조주은 on 2022/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 1. 데이터 리스트가 필요
    var memoList = [
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi"),
        Memo(title: "주은", content: "hi")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 3. data source, delegate 지정해주어야 한다.
        tableView.dataSource = self
        tableView.delegate = self
    }

}

// 상속이랑 비슷함
//
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 개수 (data source)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    // cell을 어떻게 보여줄 것인가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = memoList[indexPath.row].title
        content.secondaryText = memoList[indexPath.row].content
        cell.contentConfiguration = content

        return cell
    }
}


