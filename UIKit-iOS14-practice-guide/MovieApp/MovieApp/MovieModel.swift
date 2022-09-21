// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movieModel = try? newJSONDecoder().decode(MovieModel.self, from: jsonData)

import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
}

// MARK: - Result
struct MovieResult: Codable {
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription : String?
    let longDescription : String
    let currency: String?
    let trackPrice: Double?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case currency
        case trackPrice
        case releaseDate
    }
}
