//
//  ConfirmUserResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation

// MARK: - ConfirmUserResponse
struct ConfirmUserResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Int
}
