//
//  RestResponse.swift
//  MangoClone
//
//  Created by 조주은 on 2022/07/10.
//

import Foundation

//struct RestResponse: Decodable {
//    var response: response
//}
//
//struct response: Decodable {
//    var body: body
//}
//
//struct body: Decodable {
//    var items: items
//}
//
//struct items: Decodable {
//    var item: [item]
//}
//
//struct item: Decodable {
//    var add1: String
//    var firstimage: String
//    var readcount: Int
//    var title: String
//}



// MARK: - Welcome
struct RestResponse: Codable {
    var response: Response
}

// MARK: - Response
struct Response: Codable {
    var header: Header
    var body: Body
}

// MARK: - Body
struct Body: Codable {
    var items: Items
    var numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    var item: [Item]
}

// MARK: - Item
struct Item: Codable {
    var addr1: String
    var areacode: Int
    var cat1: Cat1
    var cat2: Cat2
    var cat3: Cat3
    var contentid, contenttypeid, createdtime: Int
    var firstimage, firstimage2: String
    var mapx: Mapx
    var mapy: Double
    var mlevel, modifiedtime, readcount, sigungucode: Int
    var tel: String?
    var title, zipcode: String
}

enum Cat1: String, Codable {
    case a05 = "A05"
}

enum Cat2: String, Codable {
    case a0502 = "A0502"
}

enum Cat3: String, Codable {
    case a05020100 = "A05020100"
    case a05020400 = "A05020400"
    case a05020900 = "A05020900"
}

enum Mapx: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Mapx.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Mapx"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Header
struct Header: Codable {
    var resultCode, resultMsg: String
}


//// MARK: - Welcome
//struct RestResponse: Codable {
//    var response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    var header: Header
//    var body: Body
//}
//
//// MARK: - Body
//struct Body: Codable {
//    var items: Items
//    var numOfRows, pageNo, totalCount: Int
//}
//
//// MARK: - Items
//struct Items: Codable {
//    var item: [Item]
//}
//
//// MARK: - Item
//struct Item: Codable {
//    var addr1: String
//    var areacode: Int
//    var cat1: Cat1
//    var cat2: Cat2
//    var cat3: String
//    var contentid, contenttypeid, createdtime: Int
//    var firstimage, firstimage2: String
//    var mapx: Mapx
//    var mapy: Double
//    var mlevel, modifiedtime, readcount, sigungucode: Int
//    var tel: String?
//    var title, zipcode: String
//    var addr2: String?
//}
//
//enum Cat1: String, Codable {
//    case a05 = "A05"
//}
//
//enum Cat2: String, Codable {
//    case a0502 = "A0502"
//}
//
//enum Mapx: Codable {
//    case double(Double)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Double.self) {
//            self = .double(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(Mapx.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Mapx"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .double(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//// MARK: - Header
//struct Header: Codable {
//    var resultCode, resultMsg: String
//}
