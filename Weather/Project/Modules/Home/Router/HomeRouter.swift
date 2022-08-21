//
//  HomeRouter.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

protocol HomeRoutes: Router {
  func openCity(_ city: City)
}

final class HomeRouter: HomeRoutes {
  
  // MARK: - Properties
  
  private weak var vc: UIViewController?
  
  // MARK: - Open functions
  
  func setViewController(_ vc: UIViewController) {
    self.vc = vc
  }
  
  func openCity(_ city: City) {
    let module = CityModule(city: city)
    let cityController = module.viewController
    
    vc?.navigationController?.pushViewController(
      cityController,
      animated: true
    )
  }
}
