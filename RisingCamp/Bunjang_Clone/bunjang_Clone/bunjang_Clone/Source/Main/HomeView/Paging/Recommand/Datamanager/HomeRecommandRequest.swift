//
//  HomeRecommandRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/25.
//

import Foundation
import Alamofire

class HomeRecommandRequest {
    func getRecommandList(_ viewController: RecommandViewController) {
        let url = "\(Constant().Base_url)/bunjang/products"
        
        var hTTPHeaders = APIManager.getAPIHeader()

        AF.request(url, method: .get, parameters: nil, headers: hTTPHeaders).validate().responseDecodable(of: HomeRecommandResponse.self) { response in
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
