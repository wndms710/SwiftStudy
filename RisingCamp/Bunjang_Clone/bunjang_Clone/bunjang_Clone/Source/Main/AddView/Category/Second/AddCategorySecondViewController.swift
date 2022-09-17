//
//  AddCategorySecondViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import UIKit

class AddCategorySecondViewController: UIViewController {

    //MARK: - properties
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBAction func backToTotal(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var firstCategoryLabel: UILabel! {
        didSet {
            firstCategoryLabel.text = AddProductInfo.firstCategory
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddCategorySecondRequest().getSecondCategory(self, firstIndex)
        scrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        let cell = UINib(nibName: "AddCategoryTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "AddCategoryTableViewCell")
    }


    //MARK: - data
    var data: [AddCategorySecondResult] = []
    var firstIndex: Int = 0
    
    
    //MARK: - API
    func didSuccess(_ response: AddCategorySecondResponse) {
        if let result = response.result {
            self.data = result
            tableView.reloadData()
            let height = scrollView.frame.height
            self.tableViewHeight.constant = height / 14 * CGFloat(data.count)
        }
    }
}


//MARK: - tableview extension
extension AddCategorySecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return AddCategoryInfo.secondData.count
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCategoryTableViewCell", for: indexPath) as! AddCategoryTableViewCell
        cell.selectionStyle = .none
        
        cell.categoryName.text = data[indexPath.row].secondCategoryName

        if data[indexPath.row].thirdCategoryExist == 0 {
            cell.thirdIsExist = false
        } else {
            cell.thirdIsExist = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = scrollView.frame.height
        return height / 14
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let secondIndex = data[index].secondCategoryID
        AddProductInfo.secondCategory = data[index].secondCategoryName
        
        if data[index].thirdCategoryExist != 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCategoryThirdViewController") as! AddCategoryThirdViewController
            vc.firstIndex = self.firstIndex
            vc.secondIndex = secondIndex
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            AddProductInfo.thirdCategory = nil
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

}

