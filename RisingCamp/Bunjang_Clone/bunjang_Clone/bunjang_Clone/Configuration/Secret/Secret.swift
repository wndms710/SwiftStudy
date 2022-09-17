//
//  Secret.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/29.
//

import Foundation

struct Secret {
    static var jwt = "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo0OSwiaWF0IjoxNjU5MDQ0Mjk3LCJleHAiOjE2NjA1MTU1MjZ9.XUgepwhA-W6ZXfoJo8hr5tKmgdT1hWt4q4dRZi92S0M"
    static var userIdx: Int = 0
    static var storeName: String = ""
    
    static var header = ["X-ACCESS-TOKEN" : jwt]
}


