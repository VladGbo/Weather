//
//  CityViewModel.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation

protocol CityViewModelProtocol {
  
}

final class CityViewModel: BaseViewModel<CityRouter>, CityViewModelProtocol {
  
  // MARK: - Properties
  
  private let city: City
  
  // MARK: - Init
  
  init(router: CityRouter, city: City) {
    self.city = city
    
    super.init(router: router)
  }
  
  
}
