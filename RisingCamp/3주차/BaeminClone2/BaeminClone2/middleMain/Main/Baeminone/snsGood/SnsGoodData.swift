//
//  SnsGoodData.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/27.
//

import Foundation
import UIKit

class SnsGoodData {
    var storename: String
    var snsImageView: UIImage!
    var snsImageName: String
    var tip: String
    var grade: String
    var time: String
    
    init(_ storename: String, _ snsImageName: String, _ tip: String, _ grade: String, _ time: String) {
        self.storename = storename
        self.snsImageName = snsImageName
        self.tip = tip
        self.grade = grade
        self.time = time
        
        self.snsImageView = UIImage(named: snsImageName)
    }

}
       
