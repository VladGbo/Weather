//
//  ProxyModule.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

final class ProxyModule {
  
  // MARK: - Properties
  
  let viewController: UIViewController
  let viewModel: ProxyLounchViewModel
  
  private let router: ProxyLounchRouter
  
  // MARK: - Init
  
  init() {
    router = ProxyLounchRouter()
    viewModel = ProxyLounchViewModel(router: router)
    viewController = ProxyLaunchController(viewModel: viewModel)
    
    viewModel.router.setViewController(viewController)
  }
}
