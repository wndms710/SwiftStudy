//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by 조주은 on 2022/09/21.
//

import Foundation

enum MovieAPIType{
    case justURL(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

enum MovieAPIError: Error {
    case badURL
}

class NetworkLayer {
    // only url
    // url + param
    
    typealias NetworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    func request(type: MovieAPIType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        
        do {        // request 가져오는 것 성공하면 실행
            let request = try buildRequest(type: type)
            
            session.dataTask(with: request) { data, response, error in
                    print((response as! HTTPURLResponse).statusCode)
                
                completion(data, response, error)
                
                }.resume()
            session.finishTasksAndInvalidate()
            
        } catch {       // request 가져오는 것을 실패하고 throw로 error가 던져지면 여기서 받음
            print(error)
        }
        
        
    }


    private func buildRequest(type: MovieAPIType) throws -> URLRequest {
        // throws: request 가져오는 것 실패하면 throw 하고 return 안하고 끝
        // 어떻게 잘못됐는지 알 수 있음
        // 여러 에러가 있을 때 throw 사용 좋음
        
        switch type {
        case .justURL(urlString: let urlString):
            guard let hasURL = URL(string: urlString)  else {
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request

        case.searchMovie(querys: let querys):
            var components = URLComponents(string: "https://itunes.apple.com/search")
            
            components?.queryItems = querys
            
            guard let hasURL = components?.url  else {
                throw MovieAPIError.badURL
            }
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
        }
        
        
    }
}
