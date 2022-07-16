//
//  MessageViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/12.
//

import UIKit

class MessageViewController: UIViewController {
    //MARK: - properties
    var messageData: [MessageItem] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MessageRequest().getMessageData(self)
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "MessageTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MessageTableViewCell")
    }
    
    func didSuccess(_ response: MessageResponse) {
        let messageList = response.gyeongnamstatList.item
        self.messageData = messageList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        
        cell.title.text = "\(messageData[indexPath.section].title)"
        cell.name.text = "\(messageData[indexPath.section].author)"
        cell.date.text = "\(messageData[indexPath.section].regDate) 작성"
        cell.contents.text  = "\(messageData[indexPath.section].contents)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
