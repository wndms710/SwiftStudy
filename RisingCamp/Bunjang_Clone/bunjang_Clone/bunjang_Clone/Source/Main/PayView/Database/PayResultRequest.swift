//
//  PayResultRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class PayResultRequest {
    func getPayResult(_ viewController: PayViewController, _ userId: Int, _ productId: Int, _ pointScore: Int, _ paymentMethod: String) {
        let url = "\(Constant().Base_url)/bunjang/orders/directs"
        let params: Parameters = [
            "userId" : userId,
            "productId" : productId,
            "pointScore" : pointScore,
            "paymentMethod" : paymentMethod
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        AF.request(url, method: .post, parameters: params, encoding: Constant().encoding, headers: hTTPHeaders).validate().responseDecodable(of: PayResultResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("DEBUG>> Product Detail Response : \(response)")
                viewController.postPayment(response)
            case .failure(let error):
                print("DEBUG>> Product Detail Get Error : \(error)")
            
            }
        }
    }
}
