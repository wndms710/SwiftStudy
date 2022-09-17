//
//  ThirdCategoryViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import UIKit

class ThirdCategoryViewController: BaseViewController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator()
        
        ThirdCategoryProductRequest().getThirdProduct(self, firstCategoryIdx!, secondCategoryIdx!, thirdCategoryId!)

        tableView.delegate = self
        tableView.dataSource = self
        
        scrollView.delegate = self

        
        let cell = UINib(nibName: "CategoryProductTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CategoryProductTableViewCell")
    }

    //MARK: - properties
    @IBOutlet weak var imgBackView: UIView! {
        didSet {
            Constant().cornerCircle(imgBackView, imgBackView.frame.height / 2)
            Constant().makeBorder(imgBackView, 0.5, UIColor(hex: 0xEBEBEA).cgColor)
        }
    }
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.image = UIImage(named: "\(firstCategoryIdx!)")
        }
    }
    
    var productData: [ThirdCategoryProductResult] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var thirdCategoryId: Int?
    var firstCategoryIdx: Int?
    var secondCategoryIdx: Int?
    
    var thirdName: String = ""
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = thirdName
        }
    }
    
    //MARK: - API
    func getProductData(_ response: ThirdCategoryProductResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                self.productData = result
                tableView.reloadData()
                dismissIndicator()
            }
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message!)
        }
    }
    
    
    //MARK: - Action
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func homeBut(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func searchBut(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: - tableview Extension
extension ThirdCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryProductTableViewCell", for: indexPath) as! CategoryProductTableViewCell
        
        cell.selectionStyle = .none
        
        let data = productData[indexPath.row]
        
        let url = URL(string: data.productImgURL!)
        cell.img.load(url: url!)
        
        cell.price.text = "\(data.price!)원"
        cell.name.text = data.productName
        cell.location.text = "\(data.location!) • \(data.timeDiff!)"
        cell.heartCount.text = "\(data.bookmarkCnt!)"
        
        if data.safePay == "가능" {
            cell.safePay = true
        }
        else {
            cell.safePay = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GoodsDetailViewController") as! GoodsDetailViewController
        vc.productId = productData[indexPath.row].productID!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: - scroll view Extension
extension ThirdCategoryViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            if scrollView.contentOffset.y < (scrollView.frame.height - view.frame.height*0.86) {
                tableView.isScrollEnabled = false
            }
            else {
                tableView.isScrollEnabled = true
            }
        }
        
    }
}
