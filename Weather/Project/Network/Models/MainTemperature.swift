//
//  MainTemperature.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 21.08.2022.
//

struct MainTemperature: Decodable {
  
  // MARK: - Properties
  
  let temp: Double
  let tempMin: Double
  let tempMax: Double
  
  enum CodingKeys: String, CodingKey {
    case temp
    case tempMin = "temp_min"
    case tempMax = "temp_max"
  }
}
