//
//  SecondCategoryProductRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class SecondCategoryProductRequest {
    func getSecondProduct(_ viewController: SecondCategoryViewController, _ firstIdx: Int, _ secondIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/categories/\(firstIdx)/\(secondIdx)"
        let params: Parameters = [
            "firstIdx" : firstIdx,
            "secondIdx" : secondIdx
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).validate().responseDecodable(of: SecondCategoryProductResponse.self) { response in
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
