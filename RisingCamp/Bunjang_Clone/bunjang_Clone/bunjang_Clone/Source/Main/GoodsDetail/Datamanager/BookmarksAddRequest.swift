//
//  BookmarksAddRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class BookmarksAddRequest {
    func postBookmarksBool(_ viewController: GoodsDetailViewController, productIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/bookmarks/\(Constant.userIdx)/\(productIdx)"
        
        let params: Parameters = [
            "userIdx" : Constant.userIdx,
            "productIdx" : productIdx
        ]
        
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .post, parameters: params, encoding: Constant().encoding, headers: hTTPHeaders).responseDecodable(of: BookmarksAddResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("DEBUG>> Product Detail Response : \(response)")
                viewController.addBookmarks(response)
            case .failure(let error):
                print("DEBUG>> Product Detail Get Error : \(error)")
            
            }
        }
    }
}
