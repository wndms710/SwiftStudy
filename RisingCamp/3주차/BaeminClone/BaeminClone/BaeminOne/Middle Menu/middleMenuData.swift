//
//  middleMenuData.swift
//  BaeminClone
//
//  Created by 조주은 on 2022/06/24.
//

import Foundation
import UIKit

class middleMenuData {
    var menuImageName: String!
    var menuLabel: String?
    var menuImage: UIImage?
    
    init(_ menuImageName: String, _ menuLabel: String) {
        self.menuImageName = menuImageName
        self.menuImage = UIImage(named: menuImageName)
        self.menuLabel = menuLabel
    }
}
