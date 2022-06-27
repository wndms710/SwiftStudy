//
//  TopTabbarView.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/26.
//

//import UIKit
//
//protocol PagingTabbarDelegate {
//    func scrollToIndex(to index: Int)
//}
//
//class TopTabbarView: UIView {
//    private var view: UIView!
//
//    var topBarTitleList: [String] = ["배민1", "배달", "포장", "B마트", "배민스토어", "쇼핑라이브", "선물하기", "전국별미"]
//
//    // 페이지를 표시할 tabbar
//
//    @IBOutlet weak var categoryCollectionView: UICollectionView! {
//        didSet {
//            categoryCollectionView.delegate = self
//            categoryCollectionView.dataSource = self
//            categoryCollectionView.register(UINib(nibName: "TopBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopBarCollectionViewCell")
//            categoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: [])
//        }
//    }
//
//    // 콘텐츠 뷰에 따라 페이지를 바꾸어주는 코드
//    func scroll(to index: Int) {
//        categoryCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: [])
//    }
//}
//
//extension TopTabbarView: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return topBarTitleList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "TopBarCollectionViewCell", for: indexPath) as! TopBarCollectionViewCell
//
//            cell.titleLabel?.text = topBarTitleList[indexPath.row]
//
//            cell.backView?.clipsToBounds = true
//            cell.backView?.layer.cornerRadius = 20
//
//            return cell
//    }
//}
//
//
//extension TopTabbarView:  {
//    // 셀을 클릭했을 때, 콘텐츠 뷰를 해당 index로 이동
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate?
//    }
//}
