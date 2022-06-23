//
//  FriendTableViewCell.swift
//  Week3Practice
//
//  Created by 조주은 on 2022/06/23.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uiName: UILabel!
    @IBOutlet weak var uiProfileMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
