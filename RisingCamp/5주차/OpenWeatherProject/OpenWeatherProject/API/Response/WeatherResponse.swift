//
//  WeatherResponse.swift
//  OpenWeatherProject
//
//  Created by 조주은 on 2022/07/07.
//

import Foundation

// Response를 받는 것이기 때문에 Decondable 채택
struct WeatherResponse: Decodable {
    var coord: coord
    var weather: [weather]
    var base: String
    var main: main
    var visibility: Int
    var wind: wind
    var clouds: clouds
    var dt: Int
    var sys: sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct coord: Decodable {
    var lon: Float
    var lat: Float
}

struct weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct main: Decodable {
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
    var sea_level: Float
    var grnd_level: Float
}

struct wind: Decodable {
    var speed: Float
    var deg: Int
    var gust: Float
}

struct clouds: Decodable {
    var all: Int
}

struct sys: Decodable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
