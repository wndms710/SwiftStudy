//
//  PayDetailViewController.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit

class PayDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showIndicator()
        PayDetailRequest().getPayDetail(self, productId!, Constant.userIdx)
    }
    
    //MARK: - properties
    @IBOutlet weak var completeView: UIView! {
        didSet {
            Constant().makeBorder(completeView, 0.5, Constant().middleGreyColor.cgColor)
        }
    }
    var productId: Int?
    @IBOutlet weak var priceLabel: UILabel! //
    @IBOutlet weak var productImg: UIImageView! //
    @IBOutlet weak var productName: UILabel! //
    @IBOutlet weak var totalPrice: UILabel! //
    @IBOutlet weak var tradeMethod: UILabel! //
    @IBOutlet weak var orderNum: UILabel! //
    @IBOutlet weak var orderDate: UILabel! //
    @IBOutlet weak var storeName: UILabel! //
    @IBOutlet weak var paymentMethod: UILabel! //
    @IBOutlet weak var subTotalPrice: UILabel! //
    @IBOutlet weak var subPrice: UILabel! //
    @IBOutlet weak var fee: UILabel! //
    
    //MARK: - Action
    @IBAction func exitBut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backBut(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addComma(_ int: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        let result = numberFormatter.string(from: NSNumber(value: int))
        return result!
    }
    
    
    //MARK: - API
    func didSuccess(_ response: PayDetailResponse) {
        if response.isSuccess == true {
            if let result = response.result {
                if let productInfo = result.productInfo {
                    let url = URL(string: productInfo.url1!)
                    self.productImg.load(url: url!)
                    
                    self.priceLabel.text = "\(addComma(productInfo.price!))원"
                    self.productName.text = productInfo.productName!
                    self.totalPrice.text = "\(addComma(productInfo.price!))원"
                    self.storeName.text = productInfo.storeName!
                    self.subPrice.text = "\(addComma(productInfo.price!))원"
                }
                self.tradeMethod.text = result.tradeMethod!
                self.orderNum.text = "\(result.orderID!)"
                self.orderDate.text = result.orderDate!
                self.paymentMethod.text = result.paymentMethod!
                self.subTotalPrice.text = "\(addComma(result.totalPrice!))원"
                self.fee.text = "\(addComma(result.fee!))원"
                
                dismissIndicator()
            }
        }
        else {
            dismissIndicator()
            presentAlert(title: response.message!)
        }
    }
}
