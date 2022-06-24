//
//  MiddleMenuTableViewCell.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/24.
//

import UIKit

class MiddleMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    var middleMenuDataList: [middleMenuData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
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
        
        let menuCell = UINib(nibName: "middleMenuCollectionViewCell", bundle: nil)
        self.menuCollectionView.register(menuCell, forCellWithReuseIdentifier: "middleMenuCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
}

extension MiddleMenuTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return middleMenuDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "middleMenuCollectionViewCell", for: indexPath) as? middleMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let middleMenuData: middleMenuData = middleMenuDataList[indexPath.row]
        
        cell.menuImage.image = middleMenuData.menuImage
        cell.menuLabel.text = middleMenuData.menuLabel
    
        return cell
    }
    
}

// cell layout
extension MiddleMenuTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 5 - 0     // 5등분하여 배치, 옆 간격이 0이므로 0을 빼줌
        
        let size = CGSize(width: width, height: width)
        return size
    }
}
