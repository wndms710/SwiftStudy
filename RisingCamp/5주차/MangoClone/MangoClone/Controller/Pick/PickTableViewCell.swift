//
//  PickTableViewCell.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/14.
//

import UIKit

class PickTableViewCell: UITableViewCell {

    //MARK: - properties
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var explaination: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var frameView: UIView! {
        didSet {
            frameView.layer.shadowColor = UIColor.black.cgColor
            frameView.layer.masksToBounds = false
            frameView.layer.shadowOffset = CGSize(width: 0, height: 1)
            frameView.layer.shadowRadius = 1
            frameView.layer.shadowOpacity = 0.3
        }
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
