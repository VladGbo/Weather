//
//  HomeRouter.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

protocol HomeRoutes: Router {
  
}

final class HomeRouter: HomeRoutes {
  
  // MARK: - Properties
  
  private weak var vc: UIViewController?
  
  // MARK: - Open functions
  
  func setViewController(_ vc: UIViewController) {
    self.vc = vc
  }
}
