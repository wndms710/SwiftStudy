//
//  AddProductInfo.swift
//  bunjang_Clone
//
//  Created by 조주은 on 2022/07/24.
//

import Foundation

struct AddProductInfo {
    static var imgList: [String] = []
    static var name: String = ""
    static var firstCategory: String = ""
    static var secondCategory: String = ""
    static var thirdCategory: String?
    static var tag: [String?] = []
//    static var tagList: [String?] = []
    static var price: Int = 0
    static var deliverIsContained: String = "배송비별도"
    static var count: Int = 1
    static var productState: String = "중고상품"
    static var exchagedEnable: String = "교환불가"
    static var descrit: String = ""
    static var safePay: String = "가능"
    static var location: String = "지역정보 없음"
}
