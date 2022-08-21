//
//  WeatherItem.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 21.08.2022.
//

struct WeatherItem: Decodable {
  
  // MARK: - Properties
  
  let dt: Double
  let main: MainTemperature
  let weather: [Weather]
}
