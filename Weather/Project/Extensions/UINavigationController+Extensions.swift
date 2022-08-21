//
//  UINavigationController+Extensions.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

extension UINavigationController {
  class func noNavBarController() -> UINavigationController {
    let navVC = UINavigationController()
    navVC.isNavigationBarHidden = true
    return navVC
  }
}
