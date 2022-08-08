//
//  PayResultResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation

struct PayResultResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String?
}
