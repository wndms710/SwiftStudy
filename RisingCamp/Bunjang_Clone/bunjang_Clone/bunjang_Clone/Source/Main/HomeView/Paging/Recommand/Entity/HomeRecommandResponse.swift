//
//  HomeRecommandResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/25.
//

import Foundation

// MARK: - HomeRecommandResponse
struct HomeRecommandResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [HomeRecommandResult]?
}

// MARK: - Result
struct HomeRecommandResult: Decodable {
    var productID: Int
    var productImgURL: String
    var price, productName, location: String
    var timeDiff: String
    var safePay: String
    var bookmarkCnt: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productImgURL = "productImgUrl"
        case price, productName, location, timeDiff, safePay, bookmarkCnt
    }
}

