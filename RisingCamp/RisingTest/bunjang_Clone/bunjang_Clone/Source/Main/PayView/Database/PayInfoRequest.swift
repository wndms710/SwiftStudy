//
//  File.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class PayInfoRequest {
    func getPayInfo(_ viewController: PayViewController, _ id: Int) {
        let url = "\(Constant().Base_url)/bunjang/orders/directs/\(id)/\(Constant.userIdx)"
        let params: Parameters = [
            "id" : id,
            "userId" : Constant.userIdx
        ]
        
        var hTTPHeaders = APIManager.getAPIHeader()
        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).responseDecodable(of: PayInfoResponse.self) { response in
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
