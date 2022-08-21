//
//  HistoryWeather.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 21.08.2022.
//

struct HistoryWeather: Decodable {
  
  // MARK: - Properties
  
  let cod: String
  let list: [WeatherItem]
}
