//
//  ProxyLounchRouter.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

protocol ProxyLounchRoutes: Router {
  func openHome()
}

final class ProxyLounchRouter: ProxyLounchRoutes {
  
  // MARK: - Properties
  
  private weak var vc: UIViewController?
  
  // MARK: - Open functions
  
  func setViewController(_ vc: UIViewController) {
    self.vc = vc
  }
  
  func openHome() {
    let homeController = HomeModule().viewController
    let navController = UINavigationController.noNavBarController()
    navController.viewControllers = [homeController]
    navController.modalPresentationStyle = .overFullScreen
    navController.modalTransitionStyle = .flipHorizontal
    vc?.present(navController, animated: true)
  }
}
