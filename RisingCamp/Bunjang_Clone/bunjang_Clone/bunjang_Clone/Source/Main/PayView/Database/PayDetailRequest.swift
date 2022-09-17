//
//  PayDetailRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class PayDetailRequest {
    func getPayDetail(_ viewController: PayDetailViewController, _ id: Int, _ userId: Int) {
        let url = "\(Constant().Base_url)/bunjang/orders/direct-trades/\(id)/\(userId)"
        let params: Parameters = [
            "id" : id,
            "userId" : userId
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).validate().responseDecodable(of: PayDetailResponse.self) { response in
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
