//
//  TagAutoResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation

// MARK: - TagAutoResponse
struct TagAutoResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [TagAutoResult?]?
}

// MARK: - Result
struct TagAutoResult: Decodable {
    var word: String
}
