//
//  MiddelMenuTableViewCell.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/27.
//

import UIKit

class MiddelMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var middleCollectionView: UICollectionView!
    var middleMenuDataList: [middleMenuData] = []

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        middleMenuDataList.append(middleMenuData("onemanfood", "1인분"))
        middleMenuDataList.append(middleMenuData("Japanese", "돈까스,회,일식"))
        middleMenuDataList.append(middleMenuData("Chinese", "중식"))
        middleMenuDataList.append(middleMenuData("chicken", "치킨"))
        middleMenuDataList.append(middleMenuData("Korean", "백반,죽,국수"))
        middleMenuDataList.append(middleMenuData("ranking", "맛집랭킹"))
        middleMenuDataList.append(middleMenuData("cafe", "카페,디저트"))
        middleMenuDataList.append(middleMenuData("snack", "분식"))
        middleMenuDataList.append(middleMenuData("jjim", "찜,탕,찌개"))
        middleMenuDataList.append(middleMenuData("pizza", "피자"))
        middleMenuDataList.append(middleMenuData("itailan", "양식"))
        middleMenuDataList.append(middleMenuData("meat", "고기,구이"))
        middleMenuDataList.append(middleMenuData("foot", "족발,보쌈"))
        middleMenuDataList.append(middleMenuData("asian", "아시안"))
        middleMenuDataList.append(middleMenuData("burger", "버거"))
        
        middleCollectionView.delegate = self
        middleCollectionView.dataSource = self
        
        let cell = UINib(nibName: "MiddleMenuCollectionViewCell", bundle: nil)
        middleCollectionView.register(cell, forCellWithReuseIdentifier: "MiddleMenuCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}


extension MiddelMenuTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return middleMenuDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = middleCollectionView.dequeueReusableCell(withReuseIdentifier: "MiddleMenuCollectionViewCell", for: indexPath) as! MiddleMenuCollectionViewCell
        
        let middleMenuData: middleMenuData = middleMenuDataList[indexPath.row]
        
        cell.imgView.image = middleMenuData.menuImage
        cell.titleLabel.text = middleMenuData.menuLabel
        
        return cell
    }
}


extension MiddelMenuTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let width = collectionView.frame.width / 5 - 2     // 5등분하여 배치, 옆 간격이 2이므로 2을 빼줌
        let width = collectionView.frame.width / 6           // 왜 6일 때 되지..?
        let height = middleCollectionView.frame.height * 0.3
        
        let size = CGSize(width: width, height: height)
        return size
    }
}
