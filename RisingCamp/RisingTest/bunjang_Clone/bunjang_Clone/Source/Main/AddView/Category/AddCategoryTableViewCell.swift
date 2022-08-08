//
//  AddCategoryTableViewCell.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import UIKit

class AddCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var nextBut: UIImageView!
    
    var thirdIsExist: Bool? {
        didSet {
            if thirdIsExist == false {
                nextBut.isHidden = true
            }
            else {
                nextBut.isHidden = false
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
