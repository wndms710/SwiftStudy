//
//  StoreData.swift
//  BaeminClone2
//
//  Created by 조주은 on 2022/06/27.
//

import Foundation
import UIKit

class StoreData {
    var imageName: String!
    var image: UIImage!
    var storeName: String!
    var grade: String!
    var time: String!
    var minimum: String!
    var tip: String!
    var distance: String!
    
    init(_ imageName: String, _ storeName: String, _ grade: String, _ time: String, _ minimum:String, _ tip: String, _ distance: String) {
        self.imageName = imageName
        self.image = UIImage(named: imageName)
        self.storeName = storeName
        self.grade = grade
        self.time = time
        self.minimum = minimum
        self.tip = tip
        self.distance = distance
    }
}
