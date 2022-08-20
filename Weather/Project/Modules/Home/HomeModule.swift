//
//  HomeModule.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

final class HomeModule {
  
  // MARK: - Properties
  
  let viewController: UIViewController
  let viewModel: HomeViewModel
  private let router: HomeRouter
  
  // MARK: - Init
  
  init() {
    router = HomeRouter()
    viewModel = HomeViewModel(router: router)
    viewController = HomeController(viewModel: viewModel)
    
    viewModel.router.setViewController(viewController)
  }
}
