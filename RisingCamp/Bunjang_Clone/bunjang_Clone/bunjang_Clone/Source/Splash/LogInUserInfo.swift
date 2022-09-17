//
//  LogInUserInfo.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let logInUserInfo = try? newJSONDecoder().decode(LogInUserInfo.self, from: jsonData)

import Foundation

// MARK: - LogInUserInfo
struct LogInUserInfo: Encodable {
    static var userName: String = ""
    static var firstNumber: String = ""
    static var birthdate: String = ""
    static var newsAgency: String = ""
    static var phone: String = ""
    static var storeName: String = ""
    static var authNumber: String = ""
}
