//
//  CategoryProductTableViewCell.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import UIKit

class CategoryProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBOutlet weak var heartImg: UIImageView! {
        didSet {
            heartImg.alpha = 0.9
        }
    }
    
    var safePay: Bool? {
        didSet {
            if safePay == true {
                payImg.isHidden = false
            }
            else {
                payImg.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var payImg: UIImageView!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView! {
        didSet {
            Constant().cornerCircle(img, 10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        payImg.isHidden = false
    }
}
