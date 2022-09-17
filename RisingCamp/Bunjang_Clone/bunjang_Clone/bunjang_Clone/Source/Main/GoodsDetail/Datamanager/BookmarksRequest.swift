//
//  BookmarksRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/28.
//

import Foundation
import Alamofire

class BookmarksRequest {
    func getBookmarksBool(_ viewController: GoodsDetailViewController, productIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/bookmarks/\(Constant.userIdx)/\(productIdx)"
        
        let params: Parameters = [
            "userIdx" : Constant.userIdx,
            "productIdx" : productIdx
        ]
        
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).responseDecodable(of: BookmarksResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("DEBUG>> Product Detail Response : \(response)")
                viewController.getBookmarksData(response)
            case .failure(let error):
                print("DEBUG>> Product Detail Get Error : \(error)")
            
            }
        }
    }
    
    func isBookmarksBool(_ viewController: RecommandViewController, productIdx: Int) {
        let url = "\(Constant().Base_url)/bunjang/bookmarks/\(Constant.userIdx)/\(productIdx)"
        
        let params: Parameters = [
            "userIdx" : Constant.userIdx,
            "productIdx" : productIdx
        ]
        
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .get, parameters: params, headers: hTTPHeaders).responseDecodable(of: BookmarksResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("DEBUG>> Product Detail Response : \(response)")
                viewController.getBookmarks(response)
            case .failure(let error):
                print("DEBUG>> Product Detail Get Error : \(error)")
            
            }
        }
    }
}
