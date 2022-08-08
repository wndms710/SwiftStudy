//
//  AddCategoryFirstRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/23.
//

import Foundation
import Alamofire

class AddCategoryFirstRequest {
    func getAddCategoryFirst(_ viewController: AddCategoryViewController) {
        let url = "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product/categories/first"
        let params: Parameters = [ "userIdx" : Constant.userIdx ]
        
        AF.request(url, method: .get, parameters: params, headers: nil).responseDecodable(of: AddCategoryFirstResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
