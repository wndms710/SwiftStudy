//
//  HomeViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import UIKit
import ImageSlideshow

class HomeViewController: BaseViewController, UIScrollViewDelegate {
    
    //MARK: - properties
    @IBOutlet weak var collectionView: UICollectionView!
    var labelList = HomeMenuList().labelList
    var imgList = HomeMenuList().imgList
    let sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var hideView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var middleScrollView: UIScrollView!
    
    @IBOutlet weak var pageView: UIView! {
        didSet {
            Constant().cornerCircle(pageView, 4)
            pageView.alpha = 0.8
        }
    }
    @IBOutlet weak var pageLabel: UILabel!

    
    //MARK: - 스크롤 중첩 이슈 해결
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - 상단 색 바꾸기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let height = view.frame.height
            if scrollView.contentOffset.y == height * 0.12 {
                scrollView.bounces = false
            }
            
            var offset = scrollView.contentOffset.y / (height * 0.12)
            
            if offset > 1 {
                offset = 1
                hideView.isHidden = true
                
                navigationBarView.isHidden = false
                navigationBarView.alpha = 1
            }
            else {
                hideView.isHidden = false
                navigationBarView.isHidden = false
                
                hideView.alpha = 1 - offset
                navigationBarView.alpha = offset
            }
            
            if scrollView.contentOffset.y == height * 0.88 {
                
            }
        }

    }
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.scrollView.delegate = self
        
        slideShow.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cell = UINib(nibName: "HomeMenuCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "HomeMenuCollectionViewCell")
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.tabViewHeight.constant = self.tabView.intrinsicContentSize.height
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pageLabel.text = "1 / \(slideShow.images.count)"
    }
    
    
    //MARK: - Action
    @IBAction func presentMenu(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeMenuNavigationViewController") as! HomeMenuNavigationViewController
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @IBAction func search(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - 상단 배너
    @IBOutlet weak var slideShow: ImageSlideshow! {
        didSet {
            slideShow.setImageInputs([
                ImageSource(image: UIImage(named: "homebanner1")!),
                ImageSource(image: UIImage(named: "homebanner2")!),
                ImageSource(image: UIImage(named: "homebanner6")!)
            ])
            
            slideShow.slideshowInterval = 4
            slideShow.pageIndicator = LabelPageIndicator()
            slideShow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .right(padding: 20), vertical: .customBottom(padding: 20))
        }
    }

    
}


//MARK: - collectionView extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeMenuCollectionViewCell", for: indexPath) as! HomeMenuCollectionViewCell
        
        cell.title.text = self.labelList[indexPath.item]
        cell.img.image = UIImage(named: self.imgList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        let itemPerRow: CGFloat = 7
        let widthPadding = sectionInset.left * (itemPerRow + 1)
        let itemPerColumn: CGFloat = 2
        let heightPadding = sectionInset.top * (itemPerColumn + 1)
        let cellWidth = (width - widthPadding) / itemPerRow
        let cellHeight = (height - heightPadding) / itemPerColumn
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInset.left
    }

}

extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        self.pageLabel.text = "\(page + 1) / \(slideShow.images.count)"

    }
}

