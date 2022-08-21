//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 21.08.2022.
//

import UIKit

protocol WeatherCellProtocol {
  var weatherImage: UIImage? { get }
  var dateString: String { get }
  var description: String? { get }
  var temperature: String { get }
  var height: Float { get }
}

final class WeatherCellViewModel: WeatherCellProtocol {
  
  // MARK: - Properties
  
  var weatherImage: UIImage? {
    weather?.weatherImage()
  }
  
  var dateString: String {
    dateToString()
  }
  
  var description: String? {
    weather?.description
  }
  
  var temperature: String {
    temperatureString()
  }
  
  var height: Float {
    100.0
  }
  
  private var weather: Weather?
  private let unixDate: Double
  private let minTemp: Double
  private let maxTemp: Double
  private var isNeedCelsius = false
  
  // MARK: - Init
  
  init(
    weatherItem: WeatherItem
  ) {
    weather = weatherItem.weather.first
    unixDate = weatherItem.dt
    minTemp = weatherItem.main.tempMin
    maxTemp = weatherItem.main.tempMax
  }
  
  // MARK: - Private functions
  
  private func dateToString() -> String {
    let formatter = DateFormatterManager.shared
    formatter.setup(formatType: .ddMMyyyy)
    formatter.setup(timeZone: .current)
    
    let date = Date(timeIntervalSince1970: unixDate)
    
    return formatter.fetchString(from: date)
  }
  
  private func temperatureString() -> String {
    "from: \(calculateCelsiusIfMeed(index: minTemp)) to: \(calculateCelsiusIfMeed(index: maxTemp))"
  }
  
  private func calculateCelsiusIfMeed(index: Double) -> Double {
    guard isNeedCelsius == true else {
      return index
    }
    
    return index - 273.15
  }
}

final class WeatherTableViewCell: UITableViewCell, CellProtocol {
  
  // MARK: - Outlets
  
  @IBOutlet private weak var weatherImageView: UIImageView!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var temperatureLabel: UILabel!
  @IBOutlet private weak var containerView: UIView!
  
  // MARK: - LifeCycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    configure()
  }
  
  // MARK: - Open functions
  
  func setup(with model: WeatherCellProtocol) {
    weatherImageView.image = model.weatherImage
    dateLabel.text = model.dateString
    descriptionLabel.text = model.description
    temperatureLabel.text = model.temperature
  }
  
  // MARK: Private functions
  
  private func configure() {
    selectionStyle = .none
    
    containerView.layer.cornerRadius = 12.0
    containerView.layer.borderWidth = 1.5
    containerView.layer.borderColor = UIColor.black.cgColor
    containerView.clipsToBounds = true
  }
}
