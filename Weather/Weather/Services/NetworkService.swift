//
//  NetworkService.swift
//  Weather
//
//  Created by Vladislav Horbenko on 27.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation
import Alamofire

enum Result<Type> {
    case success(Type: Codable)
    case error(String)
}

class NetworkService {
    
    private let apiEndPoint = Bundle.main.infoDictionary!["ApiBaseUrl"] as! String
    private let apiKey = "0cba393b929686e2ee9ea22273486b6a"
    
    static let shared = NetworkService()
    private init() {}
    
    static func fetchWeather(cityID: Int, complition: @escaping (Result<WeatherNetworkModel>) -> Void) {
        
        let link = "\(NetworkService.shared.apiEndPoint)forecast/daily?id=\(cityID)&cnt=7&appid=\(NetworkService.shared.apiKey)"
        let param = RequestParameters(url: try! link.asURL(),
                                      method: .get,
                                      parameters: nil,
                                      header: nil)
        NetworkService.shared.makeRequest(param: param, complition: complition)
    }
    
    private func makeRequest<T: Codable>(param: RequestParameters,
                                         complition: @escaping (Result<T>) -> Void) {
        
        AF.request(param.url,
                   method: param.method,
                   parameters: param.parameters, encoding: URLEncoding.httpBody, headers: param.header).validate().responseJSON { (data) in
                    switch data.result {
                    case .success(_):
                        if let jsonData = data.data {
                            let result = try! JSONDecoder().decode(T.self, from: jsonData)
                            complition( .success(Type: result))
                        }
                    case .failure(let err):
                        complition( .error(err.errorDescription!))
                        
                    }
        }
    }
    
    
}
