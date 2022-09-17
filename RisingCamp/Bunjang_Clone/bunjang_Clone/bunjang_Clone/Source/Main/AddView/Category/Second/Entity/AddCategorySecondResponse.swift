//
//  AddCategorySecondResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation

// MARK: - AddCategorySecondResponse
struct AddCategorySecondResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [AddCategorySecondResult]?
}

// MARK: - Result
struct AddCategorySecondResult: Decodable {
    var secondCategoryName: String
    var secondCategoryID, thirdCategoryExist: Int

    enum CodingKeys: String, CodingKey {
        case secondCategoryName
        case secondCategoryID = "secondCategoryId"
        case thirdCategoryExist
    }
}
