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
}
