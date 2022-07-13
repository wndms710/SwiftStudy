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
    
    
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "PickTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "PickTableViewCell")
    }
}


//MARK: - tableView Extention
extension PickViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickTableViewCell", for: indexPath) as! PickTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.size.height
        return height * 0.45
    }
}
