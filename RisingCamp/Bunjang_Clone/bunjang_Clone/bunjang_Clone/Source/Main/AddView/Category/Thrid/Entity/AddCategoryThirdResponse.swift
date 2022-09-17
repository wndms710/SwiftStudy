//
//  AddCategoryThirdResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation

// MARK: - AddCategoryThirdResponse
struct AddCategoryThirdResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [AddCategoryThirdResult]?
}

// MARK: - Result
struct AddCategoryThirdResult: Decodable {
    var thirdCategoryName: String
    var thirdCategoryID: Int

    enum CodingKeys: String, CodingKey {
        case thirdCategoryName
        case thirdCategoryID = "thirdCategoryId"
    }
}

