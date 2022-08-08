//
//  AddViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/16.
//

import UIKit
import Then
import SnapKit
import MaterialComponents.MaterialBottomSheet
import TweeTextField
import BSImagePicker
import Photos

class AddViewController: BaseViewController, TagViewControllerDelegate {
    
    //MARK: - properties
    
    //MARK: option
    var count: String = "1"
    var isUsedStr: String = "중고상품"
    var exchangeImpossibleStr: String = "불가"
    
    var withDelivery: Bool = false
    var isSafePay: Bool = true
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    //MARK: - 카테고리
    @IBAction func tapCategory(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCategoryViewController") as! AddCategoryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    //MARK: - 중간 옵션선택 버튼
    @IBOutlet weak var optionView: UIView! {
        didSet {
            optionView.clipsToBounds = true
            optionView.layer.cornerRadius = 5
            optionView.layer.borderWidth = 0.5
            optionView.layer.borderColor = UIColor(hex: 0xC4C4C6).cgColor
        }
    }
    
    @IBAction func optionBut(_ sender: Any) {
        let optionVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionViewController") as! OptionViewController
        optionVC.delegate = self
        optionVC.count = self.count
        optionVC.productState = self.isUsedStr
        optionVC.exchangedPossible = self.exchangeImpossibleStr
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: optionVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = self.view.frame.height * 0.45
        Constant().cornerCircle(bottomSheet.view, 20)
        self.present(bottomSheet, animated: true)
    }

    
    //MARK: - option label
    @IBOutlet weak var optionLabel: UILabel! {
        didSet {
            optionLabel.text = "\(count)개 • \(isUsedStr) • 교환\(exchangeImpossibleStr)"
        }
    }
    
    
    //MARK: - 상품 설명 작성 text view
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.tintColor = .black
        }
    }
    
    //MARK: - 하단 안전결제 환영 버튼
    @IBOutlet weak var payView: UIView! {
        didSet {
            payView.clipsToBounds = true
            payView.layer.cornerRadius = 5
            payView.layer.borderWidth = 1
            payView.layer.borderColor = Constant().mainColor.cgColor
        }
    }
    @IBOutlet weak var payCheck: UIImageView! {
        didSet {
            payCheck.image = UIImage(systemName: "checkmark")
            payCheck.tintColor = Constant().mainColor
        }
    }
    @IBAction func payBut(_ sender: Any) {
        if payCheck.tintColor == Constant().mainColor {
            payView.layer.borderColor = Constant().lightGreyColor.cgColor
            payCheck.tintColor = Constant().lightGreyColor
            self.isSafePay = false
        } else {
            payView.layer.borderColor = Constant().mainColor.cgColor
            payCheck.tintColor = Constant().mainColor
            self.isSafePay = true
        }
    }
    
    //MARK: - 하단 등록 버튼
    @IBOutlet weak var registView: UIView! {
        didSet {
            registView.clipsToBounds = true
            registView.layer.cornerRadius = 5
        }
    }
    @IBAction func registBut(_ sender: Any) {
        updateData()
        if AddProductInfo.imgList.count == 0 {
            presentBottomAlert(message: "상품 사진을 등록해주세요.")
        } else {
            if AddProductInfo.name.count < 2 {
                presentBottomAlert(message: "상품명을 2글자 이상 입력해주세요")
            } else {
                if AddProductInfo.firstCategory == "" {
                    presentBottomAlert(message: "카테고리를 선택해주세요.")
                } else {
                    if AddProductInfo.price < 100 {
                        presentBottomAlert(message: "100원 이상 입력해주세요.")
                    } else {
                        if AddProductInfo.descrit.count < 10 {
                            presentBottomAlert(message: "상품 설명을 10글자 이상 입력해주세요.")
                        } else {
                            RegistRequest().registProduct(self)
                        }
                    }
                }
            }
        }
        
    }
    
    func updateImgURL() {
        var urllist: [String] = []
        for i in 0...imageUrlList.count-1 {
            if let url = self.imageUrlList[i] {
                urllist.append(url)
            }
        }
        for _ in imageUrlList.count...11 {
            urllist.append("")
        }
        AddProductInfo.imgList = urllist
    }
    
    func updateTagList() {
        var taglist: [String] = []
        if AddProductInfo.tag.count != 0 {
            for i in 0...AddProductInfo.tag.count-1 {
                if let tag = AddProductInfo.tag[i] {
                    taglist.append(tag)
                }
            }
            for _ in AddProductInfo.tag.count..<5 {
                taglist.append("")
            }
        }
        else {
            for _ in 0...4 {
                taglist.append("")
            }
        }
        AddProductInfo.tag = taglist
    }
    
    func updateData() {
        updateImgURL()
        updateTagList()
        
        AddProductInfo.name = self.productName.text ?? ""
        
        if let price = self.productPrice.text {
            if price.count > 0 {
                AddProductInfo.price = Int(price)!
            }
        }
        
        if self.isSafePay == true {
            AddProductInfo.safePay = "가능"
        } else {
            AddProductInfo.safePay = "불가"
        }
        
        if self.withDelivery == true {
            AddProductInfo.deliverIsContained = "배송비포함"
        } else {
            AddProductInfo.deliverIsContained = "배송비별도"
        }
        
        AddProductInfo.descrit = self.textView.text ?? ""
    }
    
    //MARK: - API
    func postMyProduct(_ response: RegistResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                deleteProductInfo()
                let pvc = presentingViewController! as UIViewController
                self.dismiss(animated: true) {
                    pvc.presentBottomAlert(message: result)
                }
            }
        }
        else {
            presentBottomAlert(message: response.message)
        }
    }
    
    
    
    //MARK: - 가격 옆 배송비포함 버튼
    @IBOutlet weak var deliCheck: UIImageView! {
        didSet {
            deliCheck.image = UIImage(systemName: "checkmark.circle")
            deliCheck.tintColor = Constant().lightGreyColor
        }
    }
    @IBAction func deliveryBut(_ sender: Any) {
        if deliCheck.image == UIImage(systemName: "checkmark.circle") {
            deliCheck.image = UIImage(systemName: "checkmark.circle.fill")
            deliCheck.tintColor = Constant().mainColor
            self.withDelivery = true
        } else {
            deliCheck.image = UIImage(systemName: "checkmark.circle")
            deliCheck.tintColor = Constant().lightGreyColor
            self.withDelivery = false
        }
    }
    
    
    //MARK: - backbut
    @IBAction func tapBackButton(_ sender: Any) {
        deleteProductInfo()
        self.dismiss(animated: true)
    }
    
    func deleteProductInfo() {
        AddProductInfo.imgList = []
        AddProductInfo.name = ""
        AddProductInfo.firstCategory = ""
        AddProductInfo.secondCategory = ""
        AddProductInfo.thirdCategory = nil
        AddProductInfo.tag = []
        AddProductInfo.price = 0
        AddProductInfo.deliverIsContained = "배송비별도"
        AddProductInfo.count = 1
        AddProductInfo.productState = "중고상품"
        AddProductInfo.exchagedEnable = "교환불가"
        AddProductInfo.descrit = ""
        AddProductInfo.safePay = "가능"
    }
    
    
    //MARK: - text field
    @IBOutlet weak var productName: TweeActiveTextField!
    @IBOutlet weak var productCategory: UITextField!
    @IBOutlet weak var productTag: UITextField!
    @IBOutlet weak var productPrice: TweeActiveTextField! {
        didSet {
            productPrice.addTarget(self, action: #selector(priceEditing), for: .editingDidBegin)
            productPrice.addTarget(self, action: #selector(priceFinish), for: .editingDidEnd)
        }
    }
    
    
    //MARK: - 가격
    @IBOutlet weak var priceLine: UIView!
    @IBOutlet weak var priceImg: UIImageView!
    
    @objc func priceEditing(_ sender: UITextField) {
        priceImg.isHighlighted = true
        priceLine.backgroundColor = .black
    }
    
    @objc func priceFinish(_ sender: UITextField) {
        if sender.text?.count == 0 {
            priceImg.isHighlighted = false
            priceLine.backgroundColor = UIColor(hex: 0xC4C4C6)
        }
        else {
            productPrice.isHighlighted = true
            priceLine.backgroundColor = .black
        }
    }
    
    //MARK: - tag
    @IBAction func tapTag(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TagViewController") as! TagViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateTag() {
//        print("update tag")
        if AddProductInfo.tag.count != 0 {
            tagCollectionView.reloadData()
            tagCollectionView.isHidden = false
        }
        else {
            tagCollectionView.isHidden = true
        }
    }
    
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        placeholderSetting()
        
        picker.delegate = self
        
        self.tagCollectionView.delegate = self
        self.tagCollectionView.dataSource = self
        
//        dismissKeyboardWhenTappedAround()
        
        let tagCell = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        tagCollectionView.register(tagCell, forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        self.imageCollectionView.delegate = self
        self.imageCollectionView.dataSource = self
        
        let pickCell = UINib(nibName: "PickImgCollectionViewCell", bundle: nil)
        imageCollectionView.register(pickCell, forCellWithReuseIdentifier: "PickImgCollectionViewCell")
        let imgCell = UINib(nibName: "ImgCollectionViewCell", bundle: nil)
        imageCollectionView.register(imgCell, forCellWithReuseIdentifier: "ImgCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        if AddProductInfo.firstCategory.count > 0 {
            if AddProductInfo.secondCategory.count > 0 {
                if AddProductInfo.thirdCategory?.isExists == true {
                    if let thrid = AddProductInfo.thirdCategory {
                        self.productCategory.text = "\(AddProductInfo.firstCategory) 〉 \(AddProductInfo.secondCategory) 〉 \(thrid)"
                    }
                }
                else {
                    self.productCategory.text = "\(AddProductInfo.firstCategory) 〉 \(AddProductInfo.secondCategory)"
                }
            }
        }
    }
    
    //MARK: - 이미지
    var selectedAssets: [PHAsset] = []
    var userSelectedImages: [UIImage?] = []
    var imgEdge: UIEdgeInsets = UIEdgeInsets(top: 4, left: 10, bottom: 10, right: 10)
    
    var imageUrlList: [String?] = []
    var imageList: [UIImage?] = []
    let picker = UIImagePickerController()
}


//MARK: - collectionview extension
extension AddViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.tagCollectionView {
            return AddProductInfo.tag.count
        }
        return imageList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.tagCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
            
            cell.tagLabel.text = AddProductInfo.tag[indexPath.item]
            
            return cell
        }
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickImgCollectionViewCell", for: indexPath) as! PickImgCollectionViewCell
            cell.countLabel.text = "\(imageList.count)/12"
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCollectionViewCell", for: indexPath) as! ImgCollectionViewCell
        if let img = imageList[indexPath.item - 1] {
            cell.imgView.image = img
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.tagCollectionView {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = AddProductInfo.tag[indexPath.item]
            label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            label.sizeToFit()
            let cellWidth = label.frame.width + 20
            return CGSize(width: cellWidth, height: collectionView.frame.height)
        }
        let height = collectionView.frame.height
        let cellHeight = height - (imgEdge.top * 2)
        return CGSize(width: cellHeight, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.tagCollectionView {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TagViewController") as! TagViewController
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.item == 0 {
//
            //MARK: - 이미지 여러 개 가져오는 라이브러리 사용했지만 실패
//            let imagePicker = ImagePickerController()
//            imagePicker.settings.selection.max = 12
//            imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
//
//            let vc = self
//
//            var assetsList: [PHAsset] = []
//
//            vc.presentImagePicker(imagePicker, select: { (asset) in
//                if assetsList.contains(asset) == false {
//                    assetsList.append(asset)
//                }
//            }, deselect: { (asset) in
//                if let index = assetsList.firstIndex(of: asset) {
//                    assetsList.remove(at: index)
//                }
//            }, cancel: { (assets) in
//                    // User canceled selection.
//
//            }, finish: { (assets) in
//                if (assetsList.count + self.selectedAssets.count) > 12 {
//                    self.presentBottomAlert(message: "사진은 12개 까지만 추가할 수 있어요")
//                }
//                else {
//                    self.selectedAssets = assetsList
//                    self.convertAssetToImages()
//                    collectionView.reloadData()
//                }
//             })
            self.openLibrary()
        }
    }
    
//    func convertAssetToImages() {
//
//        if selectedAssets.count != 0 {
//
//            for i in 0..<selectedAssets.count {
//
//                let imageManager = PHImageManager.default()
//                let option = PHImageRequestOptions()
//                option.isSynchronous = true
//                var thumbnail = UIImage()
//
//                imageManager.requestImage(for: selectedAssets[i],
//                                          targetSize: CGSize(width: 200, height: 200),
//                                          contentMode: .aspectFit,
//                                          options: option) { (result, info) in
//                    thumbnail = result!
//                }
//
//                let data = thumbnail.jpegData(compressionQuality: 0.7)
//                let newImage = UIImage(data: data!)
//
//                self.userSelectedImages.append(newImage! as UIImage)
//            }
//        }
//    }
    

    
}
    


//MARK: - TextView placeholder
extension AddViewController: UITextViewDelegate {
    func placeholderSetting() {
        textView.delegate = self
        textView.text = "여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요. 문의를 줄이고 더 쉽게 판매할 수 있어요. (10자 이상)"
        textView.textColor = UIColor(hex: 0xC4C4C6)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(hex: 0xC4C4C6) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요. 문의를 줄이고 더 쉽게 판매할 수 있어요. (10자 이상)"
            
            textView.textColor = UIColor(hex: 0xC4C4C6)
            
        }
    }
}

//MARK: - bottomSheet
extension AddViewController: OptionDelegate {
    func sendDate(_ count: String, _ productState: String, _ exchangedPossible: String) {
        self.isUsedStr = productState
        self.exchangeImpossibleStr = exchangedPossible
        self.count = count
        
        self.optionLabel.text = "\(self.count)개 • \(isUsedStr) • 교환\(exchangeImpossibleStr)"
        
//        print("sendDate called")
    }
}

//MARK: - ImagePicker Delegate
extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else {
            print("Camera not available")
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if imageList.count <= 12 {
                if imageList.contains(image) == false {
                    self.imageList.append(image)
                    self.imageCollectionView.reloadData()
                }
                if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                    if imageUrlList.contains(String.init(describing: imageURL)) == false {
                        self.imageUrlList.append(String.init(describing: imageURL))
//                        print(imageUrlList)
                    }
                }
            }
            else {
                presentBottomAlert(message: "사진은 12개 까지만 등록할 수 있어요.")
            }
 
        }
        dismiss(animated: true, completion: nil)
    }
    
}
