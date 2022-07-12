//
//  ListCollectionViewCell.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/07.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    //MARK: - properties
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var readCount: UILabel!
    @IBOutlet weak var blog: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
