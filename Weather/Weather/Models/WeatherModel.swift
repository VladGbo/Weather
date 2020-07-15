//
//  WeatherModel.swift
//  Weather
//
//  Created by Vladislav Horbenko on 15.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

class WeatherModel {
    
    private let weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    func fetchImageDirectionWind()-> UIImage? {
        switch weather.direction {
        case 0...22, 338...360:
            return UIImage(named: "icon_wind_n")
        case 23...68:
            return UIImage(named: "icon_wind_ne")
        case 69...114:
            return UIImage(named: "icon_wind_e")
        case 115...162:
            return UIImage(named: "icon_wind_se")
        case 163...208:
            return UIImage(named: "icon_wind_s")
        case 209...255:
            return UIImage(named: "icon_wind_ws")
        case 256...293:
            return UIImage(named: "icon_wind_w")
        case 294...337:
            return UIImage(named: "icon_wind_wn")
        default:
            return nil
        }
    }
    
    func fetchImageWeather() -> UIImage? {
        if weather.clouds > 50 {
            if let _ = weather.rain {
                return UIImage(named: "ic_white_day_rain")
            } else {
                return UIImage(named: "ic_white_day_cloudy")
            }
        }
        if weather.clouds < 50 {
            return UIImage(named: "ic_white_day_bright")
        }
        return nil
    }
}
