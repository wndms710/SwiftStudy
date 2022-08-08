//
//  TagAutoTableViewCell.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import UIKit

class TagAutoTableViewCell: UITableViewCell {
    @IBOutlet weak var autoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
