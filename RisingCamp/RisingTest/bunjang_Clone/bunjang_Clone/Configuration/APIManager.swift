//
//  APIManager.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/29.
//

import Foundation
import Alamofire

class APIManager: NSObject {
    internal static func getAPIHeader() -> HTTPHeaders {
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: Secret.jwt)
        return header
    }
}
