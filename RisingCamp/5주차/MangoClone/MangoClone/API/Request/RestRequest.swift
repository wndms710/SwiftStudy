//
//  RestRequest.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/11.
//

import Foundation
import UIKit
import Alamofire

class RestRequest {
    func getRestData(_ viewController: MainViewController) {
        let url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=Yo7E1e%2FI962lyGfKXDdiS6S8pmYi1z0%2FKO95%2BkHWwvBsVLBV5MtE3vcKxMB1yAwB2xRABkYNqd%2FJH5CkmYBvYQ%3D%3D&MobileOS=IOS&MobileApp=MangoClone&contentTypeId=39&cat2=A0502&arrange=P&areaCode=1&sigunguCode=22&_type=json"
    
    
    let params: Parameters = [
        "ServiceKey" : "Yo7E1e%2FI962lyGfKXDdiS6S8pmYi1z0%2FKO95%2BkHWwvBsVLBV5MtE3vcKxMB1yAwB2xRABkYNqd%2FJH5CkmYBvYQ%3D%3D",
        "MobileApp" : "MangoClone",
        "contentTypeId" : "39",
        "cat2" : "A0502",
        "arrange" : "P",
        "areaCode" : "1",
        "sigunguCode" : "22",
        "_type" : "json",
    ]
    
    AF.request(url,
               method: .get,
               parameters: params,
               headers: nil)
    .responseDecodable(of: RestResponse.self) { response in
        
        switch response.result {
        case .success(let response):
            print("DEBUG>> Rest Response : \(response)")
            viewController.didSuccess(response)
        case .failure(let error):
            print("DEBUG>> Rest Get error : \(error)")
        }
    }
        
    }
}
