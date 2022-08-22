//
//  EndPoint.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 22.08.2022.
//

import Alamofire

enum EndPoint {
  case currentWeather(lat: Double, lon: Double)
  case historyWeather(lat: Double, lon: Double)
  
  var method: HTTPMethod {
    switch self {
    case .currentWeather,
        .historyWeather:
      return .get
    }
  }
  
  var parameters: Parameters {
    switch self {
    case .currentWeather(let lat, let lon),
        .historyWeather(let lat, let lon):
      let param: Parameters = [
        "lat": lat,
        "lon": lon,
        "appid": apiKey
      ]
      
      return param
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .currentWeather,
        .historyWeather:
      return URLEncoding(destination: .queryString)
    }
  }
  
  var fullPath: String {
    switch self {
    case .currentWeather:
      return basePath + "weather"
    case .historyWeather:
      return basePath + "forecast"
    }
  }
  
  var headers: HTTPHeaders? {
    nil
  }
  
  private var basePath: String {
    "https://api.openweathermap.org/data/2.5/"
  }
  
  private var apiKey: String {
    "0cd74bf29e43ef1ad6afd6861cc99eb2"
  }
}
