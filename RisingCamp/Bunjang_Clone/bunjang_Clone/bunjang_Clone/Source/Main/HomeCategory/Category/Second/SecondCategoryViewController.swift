//
//  SecondCategoryViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import UIKit

class SecondCategoryViewController: BaseViewController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showIndicator()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        scrollView.delegate = self
        

        let subCell = UINib(nibName: "SubCategoryCollectionViewCell", bundle: nil)
        collectionView.register(subCell, forCellWithReuseIdentifier: "SubCategoryCollectionViewCell")
        
        let cell = UINib(nibName: "CategoryProductTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CategoryProductTableViewCell")
        
        AddCategoryThirdRequest().getHomeThirdCategory(self, firstCategoryIdx!, secondCategoryId!)
        SecondCategoryProductRequest().getSecondProduct(self, firstCategoryIdx!, secondCategoryId!)
    }
    
    //MARK: - API
    func getThirdCategory(_ response: AddCategoryThirdResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                for i in 0..<result.count {
                    self.list.append(result[i].thirdCategoryName)
                }
                
                self.result = result
                collectionView.reloadData()
                
                if result.count == 0 {
                    collectionViewHeight.constant = 0
                }
                else if result.count < 3 {
                    collectionViewHeight.constant = scrollView.frame.height * 0.06
                }
                else if result.count < 5 {
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
    
    func getProductData(_ response: SecondCategoryProductResponse) {
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


    //MARK: - properties
    var productData: [SecondCategoryProductResult] = []
    var result: [AddCategoryThirdResult] = []
    
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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var list: [String] = []
    @IBOutlet weak var scrollView: UIScrollView!
    
    var firstCategoryIdx: Int?
    var secondCategoryId: Int?
    
    var name: String = ""
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = name
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
extension SecondCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionViewCell", for: indexPath) as! SubCategoryCollectionViewCell
        
        cell.title.text = list[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = self.scrollView.frame.height * 0.06
        
        return CGSize(width: width/2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item + 1
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdCategoryViewController") as! ThirdCategoryViewController
        vc.firstCategoryIdx = self.firstCategoryIdx
        vc.secondCategoryIdx = self.secondCategoryId
        vc.thirdCategoryId = result[index-1].thirdCategoryID
        print("\(result[index-1].thirdCategoryID)")
        vc.thirdName = self.list[index - 1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - tableview Extension
extension SecondCategoryViewController: UITableViewDelegate, UITableViewDataSource {
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
extension SecondCategoryViewController: UIScrollViewDelegate {
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
