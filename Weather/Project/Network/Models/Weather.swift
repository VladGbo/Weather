//
//  Weather.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

enum WeatherIconType: String {
  case oneD = "01d"
  case twoD = "02d"
  case threeD = "03d"
  case fourD = "04d"
  case nineD = "09d"
  case tenD = "10d"
  case elevenD = "11d"
  case thirteenD = "13d"
  case fiftyD = "50d"
  case fiftyN = "50n"
  case thirteenN = "13n"
  case elevenN = "11n"
  case tenN = "10n"
  case nineN = "09n"
  case fourN = "04n"
  case threeN = "03n"
  case twoN = "02n"
  case oneN = "01n"
}

struct Weather: Decodable {
  
  // MARK: - Properties
  
  let id: Int
  let main: String
  let description: String
  let icon: String
  
  // MARK: - Open functions
  
  func weatherImage() -> UIImage? {
    guard let iconType = WeatherIconType(rawValue: icon) else {
      return nil
    }
    
    switch iconType {
    case .oneD:
      return AppImage.WeatherIcon.oneD
    case .twoD:
      return AppImage.WeatherIcon.twoD
    case .threeD:
      return AppImage.WeatherIcon.threeD
    case .fourD:
      return AppImage.WeatherIcon.fourD
    case .nineD:
      return AppImage.WeatherIcon.nineD
    case .tenD:
      return AppImage.WeatherIcon.tenD
    case .elevenD:
      return AppImage.WeatherIcon.elevenD
    case .thirteenD:
      return AppImage.WeatherIcon.thirteenD
    case .fiftyD:
      return AppImage.WeatherIcon.fiftyD
    case .fiftyN:
      return AppImage.WeatherIcon.fiftyN
    case .thirteenN:
      return AppImage.WeatherIcon.thirteenN
    case .elevenN:
      return AppImage.WeatherIcon.elevenN
    case .tenN:
      return AppImage.WeatherIcon.tenN
    case .nineN:
      return AppImage.WeatherIcon.nineN
    case .fourN:
      return AppImage.WeatherIcon.fourN
    case .threeN:
      return AppImage.WeatherIcon.threeN
    case .twoN:
      return AppImage.WeatherIcon.twoN
    case .oneN:
      return AppImage.WeatherIcon.oneN
    }
  }
}
