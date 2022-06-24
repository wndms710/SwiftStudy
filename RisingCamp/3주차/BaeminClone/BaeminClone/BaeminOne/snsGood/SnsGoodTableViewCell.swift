//
//  SnsGoodTableViewCell.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/24.
//

import UIKit

class SnsGoodTableViewCell: UITableViewCell {
    @IBOutlet weak var snsCollectionView: UICollectionView!
    var snsDataList: [SnsGoodData] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        snsCollectionView.delegate = self
        snsCollectionView.dataSource = self
        
        snsDataList.append(SnsGoodData("스와가트 은평뉴타운점", "newyork", "550원", "5.0", "18~28분"))
        snsDataList.append(SnsGoodData("이상향 연신내점", "esang", "2,000원", "4.8", "20~30분"))
        snsDataList.append(SnsGoodData("호픈 hoffen", "hoffen", "2,500원", "5.0", "18~28분"))
        snsDataList.append(SnsGoodData("오봉집 직화낙지보쌈 녹번점", "obong", "3,000원", "4.8", "18~28분"))
        snsDataList.append(SnsGoodData("중화원", "jung", "3,000원", "3.8", "12~22분"))
        snsDataList.append(SnsGoodData("코스믹 버거랩", "cosmicburger", "2,000원~3,000원", "4.9", "27~37분"))
        
        let snsCell = UINib(nibName: "SnsGoodCollectionViewCell", bundle: nil)
        
        self.snsCollectionView.register(snsCell, forCellWithReuseIdentifier: "SnsGoodCollectionViewCell")
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SnsGoodTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = snsCollectionView.dequeueReusableCell(withReuseIdentifier: "SnsGoodCollectionViewCell", for: indexPath) as! SnsGoodCollectionViewCell
        
        let snsData: SnsGoodData = snsDataList[indexPath.row]
        
        cell.storename.text = snsData.storename
        cell.snsImageView.image = snsData.snsImageView
        cell.tip.text = snsData.tip
        cell.grade.text = snsData.grade
        cell.time.text = snsData.time
        
        return cell
    }
    
    
}
