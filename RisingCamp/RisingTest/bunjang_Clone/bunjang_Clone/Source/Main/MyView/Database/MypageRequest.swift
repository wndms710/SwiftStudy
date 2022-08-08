//
//  MypageRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class MypageRequest {
    func getMyPage(_ viewController: MyViewController) {
        let url = "\(Constant().Base_url)/bunjang/users/\(Constant.userIdx)/my"
        let params: Parameters = [
            "userIdx" : Constant.userIdx
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).validate().responseDecodable(of: MypageResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("DEBUG>> Product Detail Response : \(response)")
                viewController.didSuccess(response)
            case .failure(let error):
                print("DEBUG>> Product Detail Get Error : \(error)")
            
            }
        }
    }
}
