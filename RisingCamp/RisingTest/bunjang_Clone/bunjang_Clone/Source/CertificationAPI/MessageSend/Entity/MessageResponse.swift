//
//  MessageResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation

// MARK: - MessageResponse
struct MessageResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message, result: String
}

