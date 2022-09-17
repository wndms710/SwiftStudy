//
//  MessageCheckRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation
import Alamofire

class MessageCheckRequest {
    func messageCheck(_ viewController: NumberViewController) {
        let url = "\(Constant().Base_url)/bunjang/users/checks/send-sms/\(LogInUserInfo.phone)/\(LogInUserInfo.authNumber)"
        let params: Parameters = [
            "phone" : LogInUserInfo.phone,
            "number" : LogInUserInfo.authNumber
        ]
        
        AF.request(url, method: .get
                   , parameters: params, headers: nil).responseDecodable(of: MessageCheckResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
