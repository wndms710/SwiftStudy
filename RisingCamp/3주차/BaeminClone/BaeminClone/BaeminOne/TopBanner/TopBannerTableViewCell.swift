//
//  TopBannerTableViewCell.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/23.
//

import UIKit

class TopBannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        bannerTimer()
        
    }
    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0
    
    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "topbanner1")!, UIImage(named: "topbanner2")!, UIImage(named: "topbanner3")!]

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension TopBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    // 컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    
    // UICollectionViewDelegateFlowLayout 상속
    // 컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.height)
    }
    
    // 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}


extension TopBannerTableViewCell {
    // 3초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    // 배너 움직이는 메소드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == dataArray.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        
        // 다음 페이지로 전환
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
}
