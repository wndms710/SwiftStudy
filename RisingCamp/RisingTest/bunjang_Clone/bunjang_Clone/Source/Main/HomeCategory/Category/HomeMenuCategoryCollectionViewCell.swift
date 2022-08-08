//
//  HomeMenuCategoryCollectionViewCell.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/27.
//

import UIKit

class HomeMenuCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
//    {
//        didSet {
//            self.title.text = name
//        }
//    }
    
    @IBOutlet weak var img: UIImageView!
//    {
//        didSet {
//            self.img.image = UIImage(named: "\(String(describing: imgNum))")
//        }
//    }
    
//    var imgNum : Int?
//    var name: String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
