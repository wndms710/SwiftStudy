//
//  TopBannerTableViewCell.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/26.
//

import UIKit

class TopBannerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    // 현재 페이지 체크 변수
    var nowPAge: Int = 0
    
    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "baeminbanner1")!, UIImage(named: "baeminbanner2")!, UIImage(named: "baeminbanner3")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bannerTimer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        let cell = UINib(nibName: "bannerCollectionViewCell", bundle: nil)
        bannerCollectionView.register(cell, forCellWithReuseIdentifier: "bannerCollectionViewCell")

    }
    
}

extension TopBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "bannerCollectionViewCell", for: indexPath) as! bannerCollectionViewCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
}

extension TopBannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.size.height)
    }
    
    // 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPAge = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension TopBannerTableViewCell {
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    func bannerMove() {
        if nowPAge == dataArray.count - 1 {
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPAge = 0
            return
        }
        
        nowPAge += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPAge, section: 0) as IndexPath, at: .right, animated: true)

    }
}
