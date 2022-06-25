//
//  ViewController.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBackView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    var nowPage: Int = 0
    let dataArray: Array<UIImage> = [UIImage(named: "mainbanner1")!, UIImage(named: "mainbanner2")!, UIImage(named: "mainbanner3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "우리집"
        
        searchBackView.clipsToBounds = true
        searchBackView.layer.cornerRadius = 20
        searchBackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMinXMaxYCorner)
        
        searchBar.searchTextField.backgroundColor = UIColor.clear
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        bannerTimer()
        
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "mainBannerollectionViewCell", for: indexPath) as! mainBannerollectionViewCell
        cell.imgView.image = dataArray[indexPath.row]
        
        // grayview 페이지 표시
        cell.totalNum.text = "\(dataArray.count)"
        cell.pageNum.text = "\(indexPath.row + 1)"
        
//        // image 모서리 둥글게
//        cell.imgView.clipsToBounds = true
//        cell.imgView.layer.cornerRadius = 20
        
        // grayview 모서리 둥글게
        cell.grayView.clipsToBounds = true
        cell.grayView.layer.cornerRadius = 15
        
        return cell
    }

}


extension ViewController: UICollectionViewDelegateFlowLayout {
    // 컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width, height: bannerCollectionView.frame.size.height)
    }
    
    // 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

// 타이머를 이용한 자동 스크롤
extension ViewController {
    
    // 3초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    // 배너 움직이는 메소드
    func bannerMove() {
            // 현재 페이지가 마지막 페이지일 경우
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
