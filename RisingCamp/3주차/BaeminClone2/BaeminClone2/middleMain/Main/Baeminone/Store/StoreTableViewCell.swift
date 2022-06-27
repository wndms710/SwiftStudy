//
//  StoreTableViewCell.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/27.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var minimun: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
