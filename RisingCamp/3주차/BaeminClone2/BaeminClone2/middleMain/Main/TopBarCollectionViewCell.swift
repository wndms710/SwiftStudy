//
//  TopBarCollectionViewCell.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/25.
//

import UIKit

class TopBarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .white
//                titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
                backView?.backgroundColor = .systemMint
            } else {
                titleLabel.textColor = .darkGray
//                titleLabel.font = UIFont.systemFont(ofSize: 15)
                backView?.backgroundColor = .clear
            }
        }
    }
    
    override func prepareForReuse() {
        isSelected = false
    }
    
}
