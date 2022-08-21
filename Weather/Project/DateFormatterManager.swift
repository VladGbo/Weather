//
//  DateFormatterManager.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 21.08.2022.
//

import Foundation

final class DateFormatterManager {
  
  enum FormatType: String {
    case ddMMyyyy = "dd.MM.yyyy"
  }
  
  // MARK: - Properties
  
  static let shared = DateFormatterManager()
  private let formatter: DateFormatter
  
  // MARK: - Init
  
  private init () {
    formatter = .init()
  }
  
  // MARK: - Open functions
  
  func setup(formatType: FormatType) {
    formatter.dateFormat = formatType.rawValue
  }
  
  func setup(timeZone: TimeZone) {
    formatter.timeZone = timeZone
  }
  
  func fetchString(from date: Date) -> String {
    formatter.string(from: date)
  }
}

