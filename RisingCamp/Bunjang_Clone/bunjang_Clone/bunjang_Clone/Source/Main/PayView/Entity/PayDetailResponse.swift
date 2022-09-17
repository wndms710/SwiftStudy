//
//  PayDetailResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let payDetailResponse = try? newJSONDecoder().decode(PayDetailResponse.self, from: jsonData)

import Foundation

// MARK: - PayDetailResponse
struct PayDetailResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: PayDetailResult?
}

// MARK: - Result
struct PayDetailResult: Decodable {
    var productInfo: PayProductInfo?
    var tradeMethod: String?
    var orderID: Int?
    var orderDate, paymentMethod, userName, phone: String?
    var totalPrice, pointScore, fee: Int?

    enum CodingKeys: String, CodingKey {
        case productInfo, tradeMethod
        case orderID = "orderId"
        case orderDate, paymentMethod, userName, phone, totalPrice, pointScore, fee
    }
}

// MARK: - ProductInfo
struct PayProductInfo: Decodable {
    var url1: String?
    var productName: String?
    var price: Int?
    var storeName: String?
}

