//
//  MainTopCollectionViewCell.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit

class MainTopCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var nowPage: Int = 0
    let dataArray: Array<UIImage> = [UIImage(named: "banner1")!, UIImage(named: "banner2")!, UIImage(named: "banner3")!, UIImage(named: "banner4")!, UIImage(named: "banner5")!, UIImage(named: "banner6")!,]
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - LiftCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cell = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        
        bannerTimer()
    }
    
}


//MARK: - collectionView
extension MainTopCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        cell.imgView.image = dataArray[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = nowPage

    }
    
    //MARK: - 타이머를 이용한 자동 스크롤
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true ){ (Timer) in
            self.bannerMove()
        }
    }
    
    func bannerMove() {
        if nowPage == dataArray.count-1 {
            collectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            pageControl.currentPage = nowPage
            return
        }
        
        nowPage += 1
        collectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        pageControl.currentPage = nowPage

    }

    
 
    
}
