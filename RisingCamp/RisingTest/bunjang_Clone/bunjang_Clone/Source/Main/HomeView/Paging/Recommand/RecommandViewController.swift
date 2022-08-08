//
//  RecommandViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import UIKit
import XLPagerTabStrip

class RecommandViewController: BaseViewController, IndicatorInfoProvider  {
    //MARK: - properties
    var childName: String = ""
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var bookmarksState: Bool?
    
    var refreshControl = UIRefreshControl()
    
    //MARK: - API
    var data: [HomeRecommandResult] = []
    func didSuccess(_ response: HomeRecommandResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                self.data = result
                let height = scrollView.frame.size.height
                let cellHeight = height * 0.5
                
                self.collectionView.reloadData()
                self.collectionViewHeight.constant = (cellHeight + sectionInsets.top) * CGFloat(data.count)
//                self.collectionViewHeight.constant = self.collectionView.contentSize.height
                dismissIndicator()
            }
        } else {
            dismissIndicator()
            presentAlert(title: "서버 오류")
        }
    }
    
    func getBookmarks(_ response: BookmarksResponse) {
        if response.isSuccess == true {
            if response.result == 0 {
                self.bookmarksState = false
            }
            else {
                self.bookmarksState = true
            }
        }
    }
    
    //MARK: - 새로고침
    @objc func pullToRefresh() {
        showIndicator()
        HomeRecommandRequest().getRecommandList(self)
        print("refresh")
        refreshControl.endRefreshing()
    }
    
    
    
    //MARK: - paging
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: childName)
    }

    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRecommandRequest().getRecommandList(self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cell = UINib(nibName: "RecomGoodsCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "RecomGoodsCollectionViewCell")
        
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.collectionView.reloadData()
        self.collectionViewHeight.constant = self.collectionView.contentSize.height
    }
}


extension RecommandViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecomGoodsCollectionViewCell", for: indexPath) as! RecomGoodsCollectionViewCell
        
        let url = URL(string: data[indexPath.row].productImgURL)
        cell.productImg.load(url: url!)
//        cell.url = url
        
        cell.name.text = data[indexPath.row].productName
        cell.price.text = "\(data[indexPath.row].price)원"
        cell.placeAneTime.text = "\(data[indexPath.row].location) • \(data[indexPath.row].timeDiff)"
        
        if data[indexPath.row].safePay == "불가" {
            cell.isPay = false
        } else {
            cell.isPay = true
        }
        
        if data[indexPath.row].bookmarkCnt > 0 {
            cell.isheart = true
            cell.heartCount.text = "\(data[indexPath.row].bookmarkCnt)"
        } else {
            cell.isheart = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = scrollView.frame.size.height
        let itemPerRow: CGFloat = 2
        let cellHeight = height * 0.5
        
        let widthPadding = sectionInsets.left * (itemPerRow + 3)
        let cellWidth = (width - widthPadding) / itemPerRow
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = data[indexPath.item].productID
 
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GoodsDetailViewController") as! GoodsDetailViewController
        vc.productId = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - 새로고침
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if (refreshControl.isRefreshing) {
//            self.refreshControl.endRefreshing()
//            collectionView.reloadData()
//        }
//    }
    
}


