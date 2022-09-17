//
//  ThirdCategoryProductResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation

// MARK: - ThirdCategoryProductResponse
struct ThirdCategoryProductResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: [ThirdCategoryProductResult]?
}

// MARK: - Result
struct ThirdCategoryProductResult: Decodable {
    var productID: Int?
    var productImgURL: String?
    var price, productName, location, timeDiff: String?
    var safePay: String?
    var bookmarkCnt: Int?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productImgURL = "productImgUrl"
        case price, productName, location, timeDiff, safePay, bookmarkCnt
    }
}
