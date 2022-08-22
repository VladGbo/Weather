//
//  CityViewModel.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation

protocol CityViewModelProtocol {
  var country: String { get }
  var animateActivityCallBack: SwitchCallBack? { get set }
  var updateTableCallBack: VoidCallBack? { get set }
  var datasurce: [WeatherCellProtocol] { get }
  
  func updateWeather()
}

final class CityViewModel: BaseViewModel<CityRouter>, CityViewModelProtocol {
  
  // MARK: - Properties
  
  var datasurce: [WeatherCellProtocol] {
    weatherModels
  }
  
  var country: String {
    city.name
  }
  
  var animateActivityCallBack: SwitchCallBack?
  var updateTableCallBack: VoidCallBack?
  
  private let city: City
  private var weatherModels: [WeatherCellProtocol] = .init()
  
  // MARK: - Init
  
  init(router: CityRouter, city: City) {
    self.city = city
    
    super.init(router: router)
  }
  
  // MARK: - Open functions
  
  func updateWeather() {
    
    let response: ((NetworResult<HistoryWeather>) -> Void) = { [weak self] response in
      self?.animateActivityCallBack?(false)
      
      guard let `self` = self else { return }
      
      switch response {
      case .error(error: let text):
        print(text)
      case .succes(object: let object):
        let weather = object.list
        self.weatherModels = weather.map({ WeatherCellViewModel(weatherItem: $0) })
        self.updateTableCallBack?()
      }
    }
    
    animateActivityCallBack?(true)
    NetworkRouter.request(
      route: .historyWeather(lat: city.coord.lat, lon: city.coord.lon),
      completion: response
    )
  }
}
