//
//  GoodsDetailViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import UIKit
import ImageSlideshow
import TagListView
import MaterialComponents.MaterialBottomSheet

class GoodsDetailViewController: BaseViewController {

    //MARK: - properties
    @IBOutlet weak var payView: UIView! {
        didSet {
            Constant().cornerCircle(payView, 5)
        }
    }
    @IBOutlet weak var talkView: UIView! {
        didSet {
            Constant().cornerCircle(talkView, 5)
        }
    }
    @IBOutlet weak var bookMark: UIImageView!
    var productId: Int = 0
    
    @IBOutlet weak var benefitView: UIView! {
        didSet {
            Constant().cornerCircle(benefitView, 5)
            Constant().makeBorder(benefitView, 0.5, Constant().middleGreyColor.cgColor)
        }
    }
    
    @IBOutlet weak var stateView: UIView! {
        didSet {
            Constant().cornerCircle(stateView, 2)
        }
    }
    @IBOutlet weak var countView: UIView! {
        didSet {
            Constant().cornerCircle(countView, 2)
        }
    }
    @IBOutlet weak var tipView: UIView! {
        didSet {
            Constant().cornerCircle(tipView, 2)
        }
    }
    @IBOutlet weak var tradeVie: UIView! {
        didSet {
            Constant().cornerCircle(tradeVie, 2)
        }
    }
    @IBOutlet weak var warningView: UIView! {
        didSet {
            Constant().cornerCircle(warningView, 5)
        }
    }
    
    var isDeli: Bool = true
    
    //MARK: - 작은 스크롤뷰
    @IBOutlet weak var subScrollView: UIScrollView!
    @IBOutlet weak var subImgView: UIImageView!
    @IBOutlet weak var subPrice: UILabel!
    @IBOutlet weak var subName: UILabel!
    
    
    //MARK: - 찜 버튼
    
    @IBAction func bookmarksBut(_ sender: Any) {
        BookmarksAddRequest().postBookmarksBool(self, productIdx: productId)
    }
    
    func addBookmarks(_ response: BookmarksAddResponse) {
        if response.isSuccess == true {
            if let text = response.result {
                if text == "상품이 찜 목록에 추가되었습니다." {
                    self.bookMark.isHighlighted = true
                    presentBottomAlert(message: text)
                }
                else {
                    self.bookMark.isHighlighted = false
                    presentBottomAlert(message: text)
                }
            }
        }
        else {
            presentAlert(title: response.message)
        }
    }
    
    
    //MARK: - API Data
    func didSuccess(_ response: DetailProductResponse) {
        if let result = response.result {
            BookmarksRequest().getBookmarksBool(self, productIdx: productId)
            updateData(result)
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message)
        }
    }
    
    func getBookmarksData(_ response: BookmarksResponse) {
        if response.isSuccess == true {
            if response.result == 1 {
                self.bookMark.isHighlighted = true
            } else {
                self.bookMark.isHighlighted = false
            }
        } else {
            presentAlert(title: response.message)
        }
    }
    
    func updateData(_ dt: DetailProductResult) {
        self.price.text = "\(dt.price)원"
        self.name.text = dt.productName
        self.location.text = "\(dt.location) • \(dt.timeDiff)"
        self.state.text = dt.productStatus
        self.count.text = "총 \(dt.count)개"
        self.delivery.text = dt.deliveryTip
        self.trade.text = dt.trade
        self.descript.text = dt.resultDescription
        self.tagListView.addTag(dt.categoryName)
        
        if let tag1 = dt.getProductTagRes.tag1 {
            if tag1.count > 0 {
                self.tagListView.addTag(tag1)
            }
        }
        if let tag2 = dt.getProductTagRes.tag2 {
            if tag2.count > 0 {
                self.tagListView.addTag(tag2)
            }
        }
        if let tag3 = dt.getProductTagRes.tag3 {
            if tag3.count > 0 {
                self.tagListView.addTag(tag3)
            }
        }
        if let tag4 = dt.getProductTagRes.tag4 {
            if tag4.count > 0 {
                self.tagListView.addTag(tag4)
            }
        }
        if let tag5 = dt.getProductTagRes.tag5 {
            if tag5.count > 0 {
                self.tagListView.addTag(tag5)
            }
        }
        
        if let url1 = dt.getProductImgRes.url1 {
            self.imgUrlList.append(url1)
            let url = URL(string: url1)
            self.subImgView.load(url: url!)
        }
        if let url2 = dt.getProductImgRes.url2 {
            self.imgUrlList.append(url2)
        }
        if let url3 = dt.getProductImgRes.url3 {
            self.imgUrlList.append(url3)
        }
        if let url4 = dt.getProductImgRes.url4 {
            self.imgUrlList.append(url4)
        }
        if let url5 = dt.getProductImgRes.url5 {
            self.imgUrlList.append(url5)
        }
        if let url6 = dt.getProductImgRes.url6 {
            self.imgUrlList.append(url6)
        }
        if let url7 = dt.getProductImgRes.url7 {
            self.imgUrlList.append(url7)
        }
        if let url8 = dt.getProductImgRes.url8 {
            self.imgUrlList.append(url8)
        }
        if let url9 = dt.getProductImgRes.url9 {
            self.imgUrlList.append(url9)
        }
        if let url10 = dt.getProductImgRes.url10 {
            self.imgUrlList.append(url10)
        }
        if let url11 = dt.getProductImgRes.url11 {
            self.imgUrlList.append(url11)
        }
        if let url12 = dt.getProductImgRes.url12 {
            self.imgUrlList.append(url12)
        }
        
        updateImageSlideShow()
        
        self.subName.text = dt.productName
        self.subPrice.text = "\(dt.price)원"
        
        self.heartCount.text = "\(dt.bookmarkCnt)"
        
        dismissIndicator()
    }
    
    func updateImageSlideShow() {
        if imgUrlList.count > 0 {
            for i in 0...imgUrlList.count-1 {
                if imgUrlList[i].contains("http") == true {
                    let url = URL(string: imgUrlList[i])
                    if let data = try? Data(contentsOf: url!) {
                        if let image = UIImage(data: data) {
                            imgList.append(ImageSource(image: image))
                        }
                    }
                }
                else {
                    let url = URL(fileURLWithPath: imgUrlList[i])
                    if let data = try? Data(contentsOf: url) {
//                    if let mydata = FileManager.default.contents(atPath: path) {
                        if let image = UIImage(data: data) {
                            imgList.append(ImageSource(image: image))
                        }
                    }
                    
                }
            }
            self.slideShow.setImageInputs(imgList)
            self.pageLabel.text = "1 / \(slideShow.images.count)"
        }
    }
    
    var imgList: [ImageSource] = []
    var imgUrlList: [String] = []
    
    @IBOutlet weak var pageView: UIView! {
        didSet {
            Constant().cornerCircle(pageView, 4)
            pageView.alpha = 0.8
        }
    }
    @IBOutlet weak var pageLabel: UILabel!
    
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator()
        
        DetailProductRequest().getProductDetailData(self, productId)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImageSlide))
        slideShow.addGestureRecognizer(tapGesture)
        
        subScrollView.delegate = self
        mainScrollView.delegate = self
        
        slideShow.delegate = self
        subScrollView.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        subScrollView.setContentOffset(CGPoint(x: 0, y: subscrollContentView.frame.height), animated: false)
        subScrollView.isHidden = false

        
    }

    
    //MARK: - image slide
    typealias EmptyClosure = (() -> ())
    var showFullScreen: EmptyClosure = {}
    
    @objc func didTapImageSlide(_ sender: UITapGestureRecognizer) {
        showFullScreen()
    }

    //MARK: - button
    @IBAction func tapBackBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func searchBut(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func payBut(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayOptionViewController") as! PayOptionViewController
        vc.delegate = self
        let bottomVC = MDCBottomSheetController(contentViewController: vc) as MDCBottomSheetController
        Constant().cornerCircle(bottomVC.view, 20)
        bottomVC.mdc_bottomSheetPresentationController?.preferredSheetHeight = view.frame.height * 0.6
        
        self.present(bottomVC, animated: true)
    }
    
    //MARK: - properties
    @IBOutlet weak var slideShow: ImageSlideshow! {
        didSet {
            slideShow.contentScaleMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var seeCount: UILabel! {
        didSet {
            let count = Int.random(in: 10...50)
            seeCount.text = "\(count)"
        }
    }
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var talkCount: UILabel! {
        didSet {
            let count = Int.random(in: 1...10)
            talkCount.text = "\(count)"
        }
    }
    
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var delivery: UILabel!
    @IBOutlet weak var trade: UILabel!
    
    @IBOutlet weak var descript: UILabel!
    
    @IBOutlet weak var tagListView: TagListView! {
        didSet {
            tagListView.textFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
    }
    @IBOutlet weak var subscrollContentView: UIView!
    @IBOutlet weak var shouldShowView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
}


//MARK: - image slide extention
extension GoodsDetailViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        self.pageLabel.text = "\(page + 1) / \(slideShow.images.count)"

    }
}

extension GoodsDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == self.mainScrollView {
            let height = mainScrollView.frame.height
            if mainScrollView.contentOffset.y > height * 0.1 {
                subScrollView.setContentOffset(CGPoint(x: 0, y: shouldShowView.frame.height), animated: true)
            }
            else {
                subScrollView.setContentOffset(CGPoint(x: 0, y: subscrollContentView.frame.height), animated: true)
            }
//        }
    }
}

extension GoodsDetailViewController: PayOptionViewControllerDelegate {
    func sendData(_ isDeliver: Bool) {
        self.isDeli = isDeliver
        if isDeli == false {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayViewController") as! PayViewController
                vc.id = self.productId
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    
    
}
