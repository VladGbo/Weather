//
//  Weather.swift
//  Weather
//
//  Created by Vladislav Horbenko on 28.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation

struct WeatherNetworkModel: Codable {

    let cnt: Int
    let list: [Weather]
    
}

struct Weather: Codable {
    let date: String
    let temp: Temp
    let pressure: Double
    let humidity: Double
    let weather: [WeatherDescription]
    let speed: Double
    let deg: Int
    let clouds: Int
    let snow: Double
}

struct Temp: Codable {
    
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
    
}

struct WeatherDescription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}
