//
//  WeatherRequest.swift
//  OpenWeatherDemoProject
//
//  Created by 김우성 on 2021/08/04.
//

import Alamofire
import UIKit

class WeatherRequest {
    
    func getWeatherData(_ viewController: ViewController) {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=70712209ed38b3c9995cdcdd87bda250"
        
        let params: Parameters = [
            "q" : "seoul",
            "appid" : "70712209ed38b3c9995cdcdd87bda250"
        ]
        
        // HTTP Method: GET
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: WeatherResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> OpenWeather Response \(response) ")
                    viewController.didSuccess(response)
                    
                case .failure(let error): 
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                    
                }
            }
    }
    
}
