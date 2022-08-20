//
//  CityModule.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation

final class CityModule {
  
  // MARK: - Properties
  
  let viewController: UIViewController
  let viewModel: CityViewModel
  private let router: CityRouter
  
  // MARK: - Init
  
  init() {
    router = CityRouter()
    viewModel = CityViewModel(router: router)
    viewController = CityController(viewModel: viewModel)
    
    viewModel.router.setViewController(viewController)
  }
}
