//
//  AppDelegate.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 19.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: - Properties
  
  var window: UIWindow?
  
  // MARK: - Open functions

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window = UIWindow()
    window?.rootViewController = ProxyModule().viewController
    window?.makeKeyAndVisible()
    
    return true
  }
}

