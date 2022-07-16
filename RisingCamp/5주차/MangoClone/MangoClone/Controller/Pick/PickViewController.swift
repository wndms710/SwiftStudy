//
//  PickViewController.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/12.
//

import UIKit


class PickViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var busanData: [BusanItem] = []
    
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BusanRequest().getBusanData(self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "PickTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "PickTableViewCell")
    }
    
    //MARK: - API
    func didSuccess(_ response: BusanResponse) {
        let busanDataList = response.getFoodKr.item
        self.busanData = busanDataList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: - tableView Extention
extension PickViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busanData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickTableViewCell", for: indexPath) as! PickTableViewCell
        
        cell.title.text = "\(indexPath.row + 1). \(busanData[indexPath.row].mainTitle)"
        cell.position.text = "\(busanData[indexPath.row].addr1)"
        cell.explaination.text = "\(busanData[indexPath.row].itemcntnts)"
        cell.grade.text = "\(round((Double.random(in: 4.1...4.9)*10))/10)"
        
        if let data = try? Data(contentsOf: URL(string: self.busanData[indexPath.item].mainImgNormal)!) {
           //Main Thread
           DispatchQueue.main.async {
               cell.imgView.image = UIImage(data: data)
           }
       }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.size.height
        return height * 0.47
    }
}
