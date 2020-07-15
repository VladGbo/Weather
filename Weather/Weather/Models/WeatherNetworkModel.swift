//
//  Weather.swift
//  Weather
//
//  Created by Vladislav Horbenko on 28.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation

struct WeatherNetworkModel: Codable {

    let timezone: String
    let daily: [Weather]
}

struct Weather: Codable {
    
    let dt: Int
    let temp: Temp
    let pressure: Int
    let humidity: Int
    let windSpeed: Double
    let clouds: Int
    let direction: Int
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case dt, temp, pressure, humidity, clouds, rain
        case windSpeed = "wind_speed"
        case direction = "wind_deg"
    }
    
    func formatDate() -> String {
        
        let date = Date(timeIntervalSince1970: Double(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, dd MMMM"
        dateFormatter.timeZone = .current
        let res = dateFormatter.string(from: date)
        return res
    }
    
    func fetchWeak() -> String {
        let date = Date(timeIntervalSince1970: Double(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        dateFormatter.timeZone = .current
        let res = dateFormatter.string(from: date)
        return res
    }
    
    func fetchTemperatureInfo() -> String {
        
        return "\(convertToCelsius(temp.min))°/\(convertToCelsius(temp.max))°"
    }
    
    private func convertToCelsius(_ temp: Double) -> Int {
        let tempC = round(temp - 273.15)
        return Int(tempC)
    }
}

struct Temp: Codable {
    let day: Double
    let min: Double
    let max: Double
}
