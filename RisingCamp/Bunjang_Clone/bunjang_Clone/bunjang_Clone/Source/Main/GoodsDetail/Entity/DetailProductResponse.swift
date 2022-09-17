//
//  DetailResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import Foundation

// MARK: - DetailProductResponse
struct DetailProductResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: DetailProductResult?
}

// MARK: - Result
struct DetailProductResult: Decodable {
    var getProductImgRes: GetProductImgRes
    var productID: Int
    var price, safePay, productName, location: String
    var timeDiff, productStatus: String
    var count: Int
    var deliveryTip, trade, resultDescription, categoryName: String
    var bookmarkCnt: Int
    var getProductTagRes: GetProductTagRes

    enum CodingKeys: String, CodingKey {
        case getProductImgRes
        case productID = "productId"
        case price, safePay, productName, location, timeDiff, productStatus, count, deliveryTip, trade
        case resultDescription = "description"
        case categoryName, bookmarkCnt, getProductTagRes
    }
}

// MARK: - GetProductImgRes
struct GetProductImgRes: Decodable {
    var url1: String?
    var url2, url3, url4: String?
    var url5, url6, url7, url8: String?
    var url9, url10, url11, url12: String?
}

// MARK: - GetProductTagRes
struct GetProductTagRes: Decodable {
    var tag1, tag2, tag3, tag4: String?
    var tag5: String?
}

