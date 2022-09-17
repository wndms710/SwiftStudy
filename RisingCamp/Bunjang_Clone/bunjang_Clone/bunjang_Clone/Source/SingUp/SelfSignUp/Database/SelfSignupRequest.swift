//
//  SelfSignupRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation
import Alamofire

class SelfSignupRequest {
    func selfSignUp(_ viewController: StoreNameViewController) {
        let url = "\(Constant().Base_url)/bunjang/users/sign-up"
        let params: Parameters = [
            "userName" : LogInUserInfo.userName,
            "firstNumber" : LogInUserInfo.firstNumber,
            "birthdate" : LogInUserInfo.birthdate,
            "newsAgency" : LogInUserInfo.newsAgency,
            "phone" : LogInUserInfo.phone,
            "storeName" : LogInUserInfo.storeName
        ]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding() as ParameterEncoding, headers: nil).responseDecodable(of: SelfResponse.self) { response in
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
