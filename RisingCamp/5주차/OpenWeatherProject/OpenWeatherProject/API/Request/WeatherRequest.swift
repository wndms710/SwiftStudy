//
//  WeatherRequest.swift
//  OpenWeatherProject
//
//  Created by 조주은 on 2022/07/07.
//

import Foundation
import UIKit
import Alamofire

class WeatherRequest {
    func getWeatherData(_ viewController: ViewController) {
        
        // openWeather에서 요구하는 타입의 url
        let url = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=aa4220e5c0040c89efa73b49168b6abd"
        
        let params: Parameters = [
            "q" : "Seoul",
            "appid" : "aa4220e5c0040c89efa73b49168b6abd"
        ]
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
        .responseDecodable(of: WeatherResponse.self) { response in
            
            switch response.result {
            case .success(let response):
                print("DEBUG>> OpenWeather Response \(response) :")
                viewController.didSuccess(response)
                
            case .failure(let error):
                print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                
            }
        
            
        }
    }
}
