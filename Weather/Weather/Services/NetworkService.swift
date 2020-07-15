//
//  NetworkService.swift
//  Weather
//
//  Created by Vladislav Horbenko on 27.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation
import Alamofire

enum Result<Type: Codable> {
    case success(Type)
    case error(String)
}

enum Forecast: String {
    case current
    case minutely
    case hourly
    case daily
}

class NetworkService {
    
    private let apiEndPoint = Bundle.main.infoDictionary!["ApiBaseUrl"] as! String
    private let apiKey = "4f5d7800cfdef14f03e2a13ca2a8b92a"
    
//    https://api.openweathermap.org/data/2.5/onecall?lat=34.330502&lon=47.159401&exclude=daily&appid=4f5d7800cfdef14f03e2a13ca2a8b92a
    
    static let shared = NetworkService()
    private init() {}
    
    static func fetchWeather(city: City, forecast: Forecast,  complition: @escaping (Result<WeatherNetworkModel>) -> Void) {
        
        let link = "\(NetworkService.shared.apiEndPoint)onecall?lat=\(city.coord.lat)&lon=\(city.coord.lon)&exclude=\(forecast.rawValue)&appid=\(NetworkService.shared.apiKey)"
        
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
                            complition( .success(result))
                        }
                    case .failure(let err):
                        complition( .error(err.errorDescription!))
                        
                    }
        }
    }
}
