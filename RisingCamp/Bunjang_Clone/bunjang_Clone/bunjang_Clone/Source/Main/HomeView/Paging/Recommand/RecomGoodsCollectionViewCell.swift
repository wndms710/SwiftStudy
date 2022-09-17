//
//  RecomGoodsCollectionViewCell.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/17.
//

import UIKit

class RecomGoodsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - properties
    @IBOutlet weak var productImg: UIImageView! {
        didSet {
            Constant().cornerCircle(productImg, 5)
        }
    }
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var placeAneTime: UILabel!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var heartViw: UIView!
    
    @IBOutlet weak var payImg: UIImageView!
    
    @IBOutlet weak var payToLocation: NSLayoutConstraint!
    @IBOutlet weak var payToHeart: NSLayoutConstraint!
    
    var url: URL? {
        didSet {
            self.productImg.load(url: url!)
        }
    }
    
    @IBOutlet weak var heartImg: UIImageView!
    var isBookmared: Bool? {
        didSet {
            if isBookmared == true {
                heartImg.isHighlighted = true
            }
            else if isBookmared == false {
                heartImg.isHighlighted = false
            }
        }
    }
    
    
    var isPay: Bool? {
        didSet {
            if isPay == true {
                payImg.isHidden = false
            }
            else {
                payImg.isHidden = true
            }
        }
    }
    
    var isheart: Bool? {
        didSet {
            if isheart == true {
                heartViw.isHidden = false
                payToLocation.priority = UILayoutPriority(250)
                payToHeart.priority = UILayoutPriority(1000)
            }
            else {
                heartViw.isHidden = true
                payToHeart.priority = UILayoutPriority(250)
                payToLocation.priority = UILayoutPriority(1000)
                payToLocation.constant = 5
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
