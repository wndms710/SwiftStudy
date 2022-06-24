//
//  SnsGoodCollectionViewCell.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/24.
//

import UIKit

class SnsGoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storename: UILabel!
    @IBOutlet weak var snsImageView: UIImageView!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
