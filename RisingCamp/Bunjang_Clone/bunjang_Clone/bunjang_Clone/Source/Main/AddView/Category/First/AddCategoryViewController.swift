//
//  AddCategoryViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    //MARK: - properties
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        let cell = UINib(nibName: "AddCategoryTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "AddCategoryTableViewCell")
        
        AddCategoryFirstRequest().getAddCategoryFirst(self)
    }
    
    //MARK: - data
    var categoryData: [AddCategoryFirstResult] = []
    
    //MARK: - API
    func didSuccess(_ response: AddCategoryFirstResponse) {
        if let data = response.result {
            self.categoryData = data
        }
        
        //MARK: 스크롤뷰 안의 테이블 뷰 높이 설정
        let height = scrollView.frame.height
        self.tableViewHeight.constant = height / 14 * CGFloat((categoryData.count))
        
        tableView.reloadData()
    }
    
}


//MARK: - tableview extension
extension AddCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCategoryTableViewCell", for: indexPath) as! AddCategoryTableViewCell
        cell.selectionStyle = .none
        
        cell.categoryName.text = categoryData[indexPath.row].categoryName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = scrollView.frame.height
        return height / 14
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        AddProductInfo.firstCategory = categoryData[index].categoryName
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCategorySecondViewController") as! AddCategorySecondViewController
        vc.firstIndex = index+1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
