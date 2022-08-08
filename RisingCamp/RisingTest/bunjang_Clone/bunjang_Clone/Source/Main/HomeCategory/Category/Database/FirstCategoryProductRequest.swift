//
//  FirstCategoryProductRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class FirstCategoryProductRequest {
    func getFirstProduct(_ viewController: FirstCategoryViewController, _ firstIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/categories/\(firstIdx)"
        let params: Parameters = [
            "firstIdx" : firstIdx
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).validate().responseDecodable(of: FirstCategoryProductResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("DEBUG>> Product Detail Response : \(response)")
                viewController.getProductData(response)
            case .failure(let error):
                print("DEBUG>> Product Detail Get Error : \(error)")
            
            }
        }
    }
}
