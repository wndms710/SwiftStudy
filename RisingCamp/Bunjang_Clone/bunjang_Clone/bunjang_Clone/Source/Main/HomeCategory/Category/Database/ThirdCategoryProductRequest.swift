//
//  ThirdCategoryProductRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class ThirdCategoryProductRequest {
    func getThirdProduct(_ viewController: ThirdCategoryViewController, _ firstIdx: Int, _ secondIdx: Int, _ thirdIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/categories/\(firstIdx)/\(secondIdx)/\(thirdIdx)"
        let params: Parameters = [
            "firstIdx" : firstIdx,
            "secondIdx" : secondIdx,
            "thirdIdx" : thirdIdx
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).validate().responseDecodable(of: ThirdCategoryProductResponse.self) { response in
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

