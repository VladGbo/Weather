//
//  ProxyLounchViewModel.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation

protocol ProxyLounchViewModelProtocol: BaseViewModelProtocol {
  var activateIndicatorCallBack: SwitchCallBack? { get set }
  
  func initiate()
}

final class ProxyLounchViewModel: BaseViewModel<ProxyLounchRouter>, ProxyLounchViewModelProtocol {
  
  // MARK: - Properties
  
  var activateIndicatorCallBack: SwitchCallBack?
  
  func initiate() {
    activateIndicatorCallBack?(true)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      self?.activateIndicatorCallBack?(false)
      self?.router.openHome()
    }
  }
}
