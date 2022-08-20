//
//  CityRouter.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation
import UIKit

protocol CityRoutes: Router {
  
}

final class CityRouter: CityRoutes {
  
  // MARK: - Properties
  
  private weak var vc: UIViewController?
  
  // MARK: - Open functions
  
  func setViewController(_ vc: UIViewController) {
    self.vc = vc
  }
}
