//
//  PayInfoResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation

struct PayInfoResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: PayInfoResult?
}

struct PayInfoResult: Decodable {
    var url1: String
    var productName: String
    var price: Int
    var pointScore: Int
    var fee: Int
}
