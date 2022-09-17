//
//  MyViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import UIKit

class MyViewController: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator()
        MypageRequest().getMyPage(self)
        
//        middleScrollView.refreshControl = refreshControl
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let cell = UINib(nibName: "SellProductTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "SellProductTableViewCell")
    }
    
    
    //MARK: - properties

    @IBOutlet weak var bannerView: UIView! {
        didSet {
            Constant().cornerCircle(bannerView, 5)
        }
    }
    @IBOutlet weak var moonView: UIView! {
        didSet{
            Constant().cornerCircle(moonView, 10)
            Constant().makeBorder(moonView, 0.5, Constant().middleGreyColor.cgColor.copy(alpha: 0.7)!)
        }
    }
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var storeImg: UIImageView! {
        didSet {
            Constant().cornerCircle(storeImg, storeImg.frame.height / 2)
        }
    }
    @IBOutlet weak var bookmarksCount: UILabel!
    
    var result: MypageResult?
    var productList: [GetUserMyProductsResList] = []
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var middleScrollView: UIScrollView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var baseScrollView: UIScrollView!
    
    //MARK: - API
    func didSuccess(_ response: MypageResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                self.result = result
                self.storeName.text = result.storeName
                if let img = result.storeProfileImgURL {
                    if img.count > 0 {
                        let url = URL(string: img)
                        self.storeImg.load(url: url!)
                    }
                }
                self.bookmarksCount.text = "\(result.bookmarkCnt!)"
                
                self.productList = result.getUserMyProductsResList ?? []
                self.count.text = "\(productList.count)개"
                if productList.count > 0 {
                    tableView.isHidden = false
                    tableView.reloadData()
                    viewHeight.constant = view.frame.height * 0.15 * CGFloat(productList.count)
                }
                else {
                    tableView.isHidden = true
                }

                dismissIndicator()
            }
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message!)
        }
    }
    
    //MARK: - 새로고침
    @objc func refresh() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    //MARK: - Paging
    @IBAction func isIng(_ sender: Any) {
        beHightlighted(1)
        
        beNormal(2)
        beNormal(3)
        
        self.threeLabel.text = "판매중 상품이 없습니다."
        MypageRequest().getMyPage(self)
        if productList.count < 1 {
            tableView.isHidden = true
            viewHeight.constant = middleScrollView.frame.height * 0.55
        }
    }
    
    @IBAction func isRe(_ sender: Any) {
        beHightlighted(2)
        
        beNormal(1)
        beNormal(3)
        
        self.threeLabel.text = "예약중인 상품이 없습니다."
        self.count.text = "0개"
        viewHeight.constant = middleScrollView.frame.height * 0.55
        tableView.isHidden = true
    }
    
    @IBAction func isDone(_ sender: Any) {
        beHightlighted(3)
        
        beNormal(2)
        beNormal(1)
        
        self.threeLabel.text = "판매완료된 상품이 없습니다."
        self.count.text = "0개"
        viewHeight.constant = middleScrollView.frame.height * 0.55
        tableView.isHidden = true
    }
    
    func beHightlighted(_ tag: Int) {
        let label = view.viewWithTag(tag) as! UILabel
        let line = view.viewWithTag(tag+3)!
        
        label.textColor = .black
        line.isHidden = false
    }
    func beNormal(_ tag: Int) {
        let label = view.viewWithTag(tag) as! UILabel
        let line = view.viewWithTag(tag+3)!
        
        label.textColor = UIColor(hex: 0x828095)
        line.isHidden = true
    }
    
    
    //MARK: - Action
    @IBAction func settingBut(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - tableview extension
extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SellProductTableViewCell", for: indexPath) as! SellProductTableViewCell
        
        cell.selectionStyle = .none
        
        let data = productList[indexPath.row]
        
        let url = URL(string: data.productImgURL!)
        cell.productImg.load(url: url!)
        
        cell.timeDiff.text = data.timeDiff!
        cell.price.text = data.price!
        cell.name.text = data.productName!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.frame.height
        return height * 0.15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GoodsDetailViewController") as! GoodsDetailViewController
        vc.productId = productList[indexPath.row].productIdx!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//            if (refreshControl.isRefreshing) {
//                self.refreshControl.endRefreshing()
//                tableView.reloadData()
//            }
//        }
//
}

//extension MyViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == self.baseScrollView {
//            if scrollView.contentOffset.y < baseScrollView.frame.height * 0.3 {
//                middleScrollView.isScrollEnabled = false
//            }
//
//                middleScrollView.isScrollEnabled = true
//
//        }
//    }
//}
