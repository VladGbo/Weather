//
//  BaseViewModel.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

protocol BaseViewModelProtocol {}

protocol Router {
  func setViewController(_ vc: UIViewController)
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
  
  // MARK: - Properties
  
  let router: R
  
  // MARK: - Init
  
  init(router: R) {
    self.router = router
  }
}
