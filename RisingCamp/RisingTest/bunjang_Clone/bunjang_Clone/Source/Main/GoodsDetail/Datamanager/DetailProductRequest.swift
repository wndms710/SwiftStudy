//
//  DetailRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/18.
//

import Foundation
import Alamofire

class DetailProductRequest {
    func getProductDetailData(_ viewController: GoodsDetailViewController, _ productIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/products/\(productIdx)/\(Constant.userIdx)"
        
        let params: Parameters = [
            "productIdx" : productIdx,
            "userIdx" : Constant.userIdx
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).validate().responseDecodable(of: DetailProductResponse.self) { response in
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
