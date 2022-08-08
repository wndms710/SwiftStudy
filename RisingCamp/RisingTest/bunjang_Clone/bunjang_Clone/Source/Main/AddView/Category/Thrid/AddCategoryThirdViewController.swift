//
//  AddCategoryThirdViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import UIKit

class AddCategoryThirdViewController: UIViewController {

    //MARK: - properties
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBAction func backToSecond(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backToTotal(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCategoryViewController") as! AddCategoryViewController
//        self.navigationController?.popToViewController(vc, animated: true)
    }

    @IBOutlet weak var secondCategory: UILabel! {
        didSet {
            secondCategory.text = AddProductInfo.firstCategory
        }
    }
    @IBOutlet weak var lastCategory: UILabel! {
        didSet {
            lastCategory.text = AddProductInfo.secondCategory
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        AddCategoryThirdRequest().getThirdCategory(self, firstIndex, secondIndex)
        
        scrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        let cell = UINib(nibName: "AddCategoryTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "AddCategoryTableViewCell")

    }


    //MARK: - API
    var firstIndex: Int = 0
    var secondIndex: Int = 0
    var data: [AddCategoryThirdResult] = []
    func didSuccess(_ response: AddCategoryThirdResponse) {
        if let result = response.result {
            self.data = result
            tableView.reloadData()
            let height = scrollView.frame.height
            self.tableViewHeight.constant = height / 14 * CGFloat(data.count)
        }
    }
    
}


//MARK: - tableview extension
extension AddCategoryThirdViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCategoryTableViewCell", for: indexPath) as! AddCategoryTableViewCell
        cell.selectionStyle = .none
        
        cell.thirdIsExist = false
        
        cell.categoryName.text = data[indexPath.row].thirdCategoryName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = scrollView.frame.height
        return height / 14
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        AddProductInfo.thirdCategory = data[index].thirdCategoryName
        self.navigationController?.popToRootViewController(animated: true)
    }

}


