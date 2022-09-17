//
//  Constant.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/16.
//

import UIKit
import Alamofire

struct Constant {
    let mainColor: UIColor = UIColor(hex: 0xD03A2D)
    let lightGreyColor: UIColor = UIColor(hex: 0xE5E5E5)
    let middleGreyColor: UIColor = UIColor(hex: 0x979797)
    let tabBarIconColor: UIColor = UIColor(hex: 0x8F8F8F)
    
    func cornerCircle(_ view: UIView, _ radius: CGFloat) {
        view.clipsToBounds = true
        view.layer.cornerRadius = radius
    }
    
    func makeBorder(_ view: UIView, _ borderWidth: CGFloat, _ borderColor: CGColor) {
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor
    }
    
//    let Base_url = "http://127.0.0.1:9000"
    let Base_url = "https://prod.roomq.shop"
    
    static var userIdx: Int = 48
    var storeName: String = "오공"
    let encoding: ParameterEncoding = JSONEncoding() as ParameterEncoding
}
