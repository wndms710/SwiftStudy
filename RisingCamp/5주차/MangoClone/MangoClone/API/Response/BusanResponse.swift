//
//  BusanResponse.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/14.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let busanResponse = try? newJSONDecoder().decode(BusanResponse.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let busanResponse = try? newJSONDecoder().decode(BusanResponse.self, from: jsonData)

import Foundation

// MARK: - BusanResponse
struct BusanResponse: Decodable {
    var getFoodKr: GetFoodKr
}

// MARK: - GetFoodKr
struct GetFoodKr: Decodable {
    var header: BusanHeader
    var item: [BusanItem]
    var numOfRows, pageNo, totalCount: Int
}

// MARK: - Header
struct BusanHeader: Decodable {
    var code, message: String
}

// MARK: - Item
struct BusanItem: Decodable {
    var ucSeq: Int
    var mainTitle, gugunNm: String
    var lat, lng: Double
    var place, title, subtitle, addr1: String
    var addr2, cntctTel: String
    var homepageURL: String
    var usageDayWeekAndTime, rprsntvMenu: String
    var mainImgNormal, mainImgThumb: String
    var itemcntnts: String

    enum CodingKeys: String, CodingKey {
        case ucSeq = "UC_SEQ"
        case mainTitle = "MAIN_TITLE"
        case gugunNm = "GUGUN_NM"
        case lat = "LAT"
        case lng = "LNG"
        case place = "PLACE"
        case title = "TITLE"
        case subtitle = "SUBTITLE"
        case addr1 = "ADDR1"
        case addr2 = "ADDR2"
        case cntctTel = "CNTCT_TEL"
        case homepageURL = "HOMEPAGE_URL"
        case usageDayWeekAndTime = "USAGE_DAY_WEEK_AND_TIME"
        case rprsntvMenu = "RPRSNTV_MENU"
        case mainImgNormal = "MAIN_IMG_NORMAL"
        case mainImgThumb = "MAIN_IMG_THUMB"
        case itemcntnts = "ITEMCNTNTS"
    }
}

