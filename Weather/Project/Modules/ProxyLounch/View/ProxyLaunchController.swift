//
//  ProxyLaunchController.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

final class ProxyLaunchController: BaseViewController<ProxyLaunchControllerView, ProxyLounchViewModelProtocol> {
  
  // MARK: - Properties
  
  private weak var activityIndicator: ActivityIndicatorView?
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    viewModel.initiate()
  }
  
  // MARK: - Private functions
  
  private func configure() {
    let `view` = contentView
    
    activityIndicator = view.activityIndicatorView.addActivityIndicatorView(bgColor: .clear)
    activityIndicator?.isHidden = true
    
    viewModel.activateIndicatorCallBack = { [weak activityIndicator] isOn in
      
      DispatchQueue.main.async {
        isOn ?
        activityIndicator?.startAnimating() :
        activityIndicator?.stopAnimating()
      }
    }
  }
}
