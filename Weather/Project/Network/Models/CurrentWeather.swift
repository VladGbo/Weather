//
//  CurrentWeather.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 22.08.2022.
//

struct CurrentWeather: Decodable {
  let weather: [Weather]
  let main: MainTemperature
}
