//
//  AddCategoryFirstResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import Foundation

// MARK: - AddCategoryFirstResponse
struct AddCategoryFirstResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [AddCategoryFirstResult]?
}

// MARK: - Result
struct AddCategoryFirstResult: Decodable {
    var categoryName: String
}
