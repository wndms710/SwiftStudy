//
//  MessageCheckResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation

// MARK: - MessageCheckResponse
struct MessageCheckResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String?
}
