//
//  MiddleMainViewController.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/25.
//

import UIKit

protocol PagingTabbarDelegate {
    func scrollToIndex(to index: Int)
}

class MiddleMainViewController: UIViewController {
    // 상단 탭바
    @IBOutlet weak var topBarCollectionView: UICollectionView!
    var topBarTitleList: [String] = ["배민1", "배달", "포장", "B마트", "배민스토어", "쇼핑라이브", "선물하기", "전국별미"]
        
    // 하단 탭바
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // bottomView 모서리 둥글게
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        
        // bottomView 그림자
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.masksToBounds = false
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 3)
        bottomView.layer.shadowRadius = 5
        bottomView.layer.shadowOpacity = 0.3
        
        topBarCollectionView.delegate = self
        topBarCollectionView.dataSource = self
        
        let topBarCell = UINib(nibName: "TopBarCollectionViewCell", bundle: nil)
        topBarCollectionView.register(topBarCell, forCellWithReuseIdentifier: "TopBarCollectionViewCell")
        topBarCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: [])
    }
    
    @IBAction func tapBottomHomeButtom(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

// top bar
extension MiddleMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topBarTitleList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topBarCollectionView.dequeueReusableCell(withReuseIdentifier: "TopBarCollectionViewCell", for: indexPath) as! TopBarCollectionViewCell

        cell.titleLabel?.text = topBarTitleList[indexPath.row]

        cell.backView?.clipsToBounds = true
        cell.backView?.layer.cornerRadius = 20

        return cell
    }
}

// top bar size
extension MiddleMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tmpLabel: UILabel = UILabel()
        tmpLabel.text = topBarTitleList[indexPath.item]
        return CGSize(width: tmpLabel.intrinsicContentSize.width, height: topBarCollectionView.frame.height)
    }
}
