//
//  RegistRequest.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/25.
//

import Foundation
import Alamofire

class RegistRequest {
    func registProduct(_ viewController: AddViewController) {
        let url = "\(Constant().Base_url)/bunjang/products/\(Constant.userIdx)/new-product"
        let params: Parameters = [
            "url1" : AddProductInfo.imgList[0],
            "url2" : AddProductInfo.imgList[1],
            "url3" : AddProductInfo.imgList[2],
            "url4" : AddProductInfo.imgList[3],
            "url5" : AddProductInfo.imgList[4],
            "url6" : AddProductInfo.imgList[5],
            "url7" : AddProductInfo.imgList[6],
            "url8" : AddProductInfo.imgList[7],
            "url9" : AddProductInfo.imgList[8],
            "url10" : AddProductInfo.imgList[9],
            "url11" : AddProductInfo.imgList[10],
            "url12" : AddProductInfo.imgList[11],
            
            "tag1" : AddProductInfo.tag[0]!,
            "tag2" : AddProductInfo.tag[1]!,
            "tag3" : AddProductInfo.tag[2]!,
            "tag4" : AddProductInfo.tag[3]!,
            "tag5" : AddProductInfo.tag[4]!,
            
            "productName" : AddProductInfo.name,
            "firstCategoryName" : AddProductInfo.firstCategory,
            "secondCategoryName" : AddProductInfo.secondCategory,
            "thirdCategoryName" : AddProductInfo.thirdCategory,
            
            "price" : AddProductInfo.price,
            "deliveryTip" : AddProductInfo.deliverIsContained,
            "count" : AddProductInfo.count,
            "productStatus" : AddProductInfo.productState,
            "trade" : AddProductInfo.exchagedEnable,
            "location" : AddProductInfo.location,
            "description" : AddProductInfo.descrit,
            "safePay" : AddProductInfo.safePay
        ]
        var hTTPHeaders = APIManager.getAPIHeader()

        
        AF.request(url, method: .post, parameters: params, encoding: Constant().encoding, headers: hTTPHeaders).validate().responseDecodable(of: RegistResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("DEBUG >> Success \(response)")
                viewController.postMyProduct(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
