//
//  MessageTimeOutRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation
import Alamofire

class MessageTimeOutRequest {
    func messageTimeOut(_ viewController: NumberViewController) {
        let url = "\(Constant().Base_url)/bunjang/users/checks/send-sms"
        let params: Parameters = [
            "phone" : LogInUserInfo.phone
        ]
        
        AF.request(url, method: .delete, parameters: params, encoding: JSONEncoding() as ParameterEncoding, headers: nil).responseDecodable(of: MessageTimeOutResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.stopTimer()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
