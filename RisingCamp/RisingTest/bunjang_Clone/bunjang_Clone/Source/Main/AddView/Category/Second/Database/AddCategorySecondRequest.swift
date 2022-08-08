//
//  AddCategorySecondRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation
import Alamofire

class AddCategorySecondRequest {
    
    func getSecondCategory(_ viewController: AddCategorySecondViewController, _ index: Int) {
        let url = "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product/categories/\(index)"
        let params: Parameters = [
            "userIdx" : Constant.userIdx,
            "firstIdx" : index
            ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).responseDecodable(of: AddCategorySecondResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getHomeSecondCategory(_ viewController: FirstCategoryViewController, _ index: Int) {
        let url = "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product/categories/\(index)"
        let params: Parameters = [
            "userIdx" : Constant.userIdx,
            "firstIdx" : index
            ]
        
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).responseDecodable(of: AddCategorySecondResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.getSecondCategory(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
