//
//  TagAutoRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation
import Alamofire

class TagAutoRequest {
    func tagAutoSearch(_ viewController: TagViewController, _ searchText: String) {
        var url = URL(string: "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product/tags/")
        url?.appendPathComponent(searchText)
        
        let urlLast = url?.absoluteString
        
        let params: Parameters = [
            "userIdx" : Constant.userIdx,
            "tagWord" : searchText
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        AF.request(urlLast!, method: .get, parameters: params, headers: hTTPHeaders).responseDecodable(of: TagAutoResponse.self) { response in
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
