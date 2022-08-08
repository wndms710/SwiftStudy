//
//  SelfSignupResponse.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation

struct SelfResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SelfResult?
    
}

struct SelfResult: Decodable {
    var userIdx: Int
    var jwt: String
}
