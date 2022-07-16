//
//  MessageResponse.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/14.
//

import Foundation

// MARK: - MessageResponse
struct MessageResponse: Decodable {
    var gyeongnamstatList: GyeongnamstatList
}

// MARK: - GyeongnamstatList
struct GyeongnamstatList: Decodable {
    var header: MessageHeader
    var item: [MessageItem]
    var numOfRows, pageNo, totalCount: Int
}

// MARK: - Header
struct MessageHeader: Decodable {
    var code, message: String
}

// MARK: - Item
struct MessageItem: Decodable {
    var entid: Int
    var title: String
    var fileurl: String
    var contents, author, regDate: String
}
