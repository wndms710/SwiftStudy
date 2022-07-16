//
//  FriendReqResponse.swift
//  TemplateExample
//
//  Created by 조주은 on 2022/07/16.
//

struct FriendReqResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
