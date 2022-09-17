//
//  AddCategoryThirdRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation
import Alamofire

class AddCategoryThirdRequest {
    func getThirdCategory(_ viewController: AddCategoryThirdViewController, _ firstIndex: Int, _ secondIndex: Int) {
        let url = "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product/categories/\(firstIndex)/\(secondIndex)"
        var hTTPHeaders = APIManager.getAPIHeader()

        AF.request(url, method: .get, parameters: nil, headers: hTTPHeaders).responseDecodable(of: AddCategoryThirdResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getHomeThirdCategory(_ viewController: SecondCategoryViewController, _ firstIndex: Int, _ secondIndex: Int) {
        let url = "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product/categories/\(firstIndex)/\(secondIndex)"
        var hTTPHeaders = APIManager.getAPIHeader()

        AF.request(url, method: .get, parameters: nil, headers: hTTPHeaders).responseDecodable(of: AddCategoryThirdResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.getThirdCategory(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
