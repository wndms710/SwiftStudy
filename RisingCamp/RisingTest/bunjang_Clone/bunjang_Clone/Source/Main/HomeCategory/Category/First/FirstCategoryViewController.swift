//
//  FirstCategoryViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import UIKit

class FirstCategoryViewController: BaseViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator()
        

        collectionView.delegate = self
        collectionView.dataSource = self
        
        AddCategorySecondRequest().getHomeSecondCategory(self, firstCategoryIdx!)
        FirstCategoryProductRequest().getFirstProduct(self, firstCategoryIdx!)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        scrollView.delegate = self
        
        let moreCell = UINib(nibName: "MoreCollectionViewCell", bundle: nil)
        let subCell = UINib(nibName: "SubCategoryCollectionViewCell", bundle: nil)
        collectionView.register(moreCell, forCellWithReuseIdentifier: "MoreCollectionViewCell")
        collectionView.register(subCell, forCellWithReuseIdentifier: "SubCategoryCollectionViewCell")
        
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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var list: [String] = ["패딩/점퍼", "코트", "맨투맨", "후드티/후드집업", "티셔츠"]
    var categoryName: String = ""
    @IBOutlet weak var scrollView: UIScrollView!
    
    var firstCategoryIdx: Int?
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.image = UIImage(named: "\(firstCategoryIdx!)")
        }
    }
    @IBOutlet weak var cateName: UILabel! {
        didSet {
            cateName.text = categoryName
        }
    }

    var result: [AddCategorySecondResult] = []
    var productData: [FirstCategoryProductResult] = []
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    //MARK: - API
    func getSecondCategory(_ response: AddCategorySecondResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                for i in 0..<result.count {
                    self.list.append(result[i].secondCategoryName)
                }
                self.result = result
                collectionView.reloadData()
                
                if self.result.count == 0 {
                    collectionViewHeight.constant = 0
                }
                else if self.result.count < 3 {
                    collectionViewHeight.constant = scrollView.frame.height * 0.06
                }
                else if self.result.count < 5 {
                    collectionViewHeight.constant = scrollView.frame.height * 0.12
                }
                else {
                    collectionViewHeight.constant = scrollView.frame.height * 0.18
                }
                
            }
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message)
        }
    }
    
    func getProductData(_ response: FirstCategoryProductResponse) {
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



//MARK: - collectionView extension
extension FirstCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item <= 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionViewCell", for: indexPath) as! SubCategoryCollectionViewCell
            
//            cell.title.text = list[indexPath.item]
            cell.title.text = self.result[indexPath.item].secondCategoryName
            return cell

        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCollectionViewCell", for: indexPath) as! MoreCollectionViewCell
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = scrollView.frame.height * 0.06
        
        return CGSize(width: width/2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item + 1
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondCategoryViewController") as! SecondCategoryViewController
        vc.firstCategoryIdx = index
        vc.secondCategoryId = self.result[index-1].secondCategoryID
        vc.name = self.result[index-1].secondCategoryName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - tableview Extension
extension FirstCategoryViewController: UITableViewDelegate, UITableViewDataSource {
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
extension FirstCategoryViewController: UIScrollViewDelegate {
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
