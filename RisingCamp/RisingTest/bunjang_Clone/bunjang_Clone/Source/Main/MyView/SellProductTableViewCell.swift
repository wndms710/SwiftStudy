//
//  SellProductTableViewCell.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import UIKit

class SellProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var fastView: UIView! {
        didSet {
            Constant().cornerCircle(fastView, 2)
            Constant().makeBorder(fastView, 1, UIColor.black.cgColor)
        }
    }
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var timeDiff: UILabel!
    @IBOutlet weak var bungaeImg: UIImageView!
    
}
