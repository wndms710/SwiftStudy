//
//  MessageRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation
import Alamofire

class MessgaeRequest {
    func sendSMS(_ viewController: SelfLogInViewController) {
        let url = "\(Constant().Base_url)/bunjang/users/checks/send-sms"
        let messageParams: Parameters = [ "phone" : LogInUserInfo.phone ]
        
        AF.request(url, method: .post, parameters: messageParams, encoding: JSONEncoding() as ParameterEncoding, headers: nil).validate().responseDecodable(of: MessageResponse.self) { response in
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
