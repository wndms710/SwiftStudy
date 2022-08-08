//
//  ConfirmUserRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/22.
//

import Foundation
import Alamofire

class ConfirmUserRequest {
    func confirmUser(_ viewController: NumberViewController) {
        let url = "\(Constant().Base_url)/bunjang/users/checks/\(LogInUserInfo.phone)"
        let params: Parameters = [ "phone" : LogInUserInfo.phone ]
        
        AF.request(url, method: .get, parameters: params, headers: nil).responseDecodable(of: ConfirmUserResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.confirmUser(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
