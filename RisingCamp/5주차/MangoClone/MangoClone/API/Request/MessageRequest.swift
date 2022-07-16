//
//  MessageRequest.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/14.
//

import Foundation
import Alamofire

class MessageRequest {
    func getMessageData(_ viewController: MessageViewController) {
        let url = "http://apis.data.go.kr/6480000/gyeongnamstat/gyeongnstatList?serviceKey=Yo7E1e%2FI962lyGfKXDdiS6S8pmYi1z0%2FKO95%2BkHWwvBsVLBV5MtE3vcKxMB1yAwB2xRABkYNqd%2FJH5CkmYBvYQ%3D%3D&numOfRows=20&pageNo=1&resultType=json"
        
        let params: Parameters = [
            "serviceKey" : "Yo7E1e%2FI962lyGfKXDdiS6S8pmYi1z0%2FKO95%2BkHWwvBsVLBV5MtE3vcKxMB1yAwB2xRABkYNqd%2FJH5CkmYBvYQ%3D%3D",
            "numOfRows" : "20",
            "pageNo" : "1",
            "resultType" : "json"
        ]
        
        AF.request(url, method: .get, parameters: params, headers: nil).responseDecodable(of: MessageResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG>> Rest Response : \(response)")
                viewController.didSuccess(response)
            case .failure(let error):
                print("DEBUG>> Rest Get error : \(error.localizedDescription)")
            }
        }
    }
}
