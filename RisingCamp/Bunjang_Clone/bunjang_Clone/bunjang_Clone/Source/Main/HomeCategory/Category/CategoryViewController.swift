//
//  CategoryViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit

class CategoryViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cell = UINib(nibName: "HomeMenuCategoryCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "HomeMenuCategoryCollectionViewCell")
    }

    @IBOutlet weak var collectionView: UICollectionView!
    let nameList = ["여성의류", "남성의류", "신발", "가방", "시계/쥬얼리", "패션 액세서리", "디지털/가전", "스포츠/레저", "차량/오토바이", "스타굿즈", "키덜트", "예술/희귀/수집품", "음반/악기", "도서/티켓/문구", "뷰티/미용", "가구/인테리어", "생활/가공식품", "유아동/출산", "반려동물용품", "기타", "번개나눔", "커뮤니티"]
    
    let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMenuCategoryCollectionViewCell", for: indexPath) as! HomeMenuCategoryCollectionViewCell
        
//        cell.imgNum = indexPath.item + 1
//        cell.name = nameList[indexPath.item]
        cell.img.image = UIImage(named: "\(indexPath.item + 1)")
        cell.title.text = nameList[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        let cellPerRow: CGFloat = 4
        let cellPerColumn: CGFloat = 6
        
        let cellHeight = (height - 50) / cellPerColumn
        let cellWidth = (width - 20) / cellPerRow
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item + 1
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstCategoryViewController") as! FirstCategoryViewController
        vc.firstCategoryIdx = index
        vc.categoryName = self.nameList[index-1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
}
