//
//  MypageResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation

// MARK: - MypageResponse
struct MypageResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: MypageResult?
}

// MARK: - Result
struct MypageResult: Decodable {
    var storeProfileImgURL: String?
    var storeName: String?
    var bookmarkCnt: Int?
    var getUserMyProductsResList: [GetUserMyProductsResList]?

    enum CodingKeys: String, CodingKey {
        case storeProfileImgURL = "storeProfileImgUrl"
        case storeName, bookmarkCnt, getUserMyProductsResList
    }
}

// MARK: - GetUserMyProductsResList
struct GetUserMyProductsResList: Decodable {
    var productIdx: Int?
    var productImgURL: String?
    var productName, price, timeDiff: String?

    enum CodingKeys: String, CodingKey {
        case productIdx
        case productImgURL = "productImgUrl"
        case productName, price, timeDiff
    }
}
