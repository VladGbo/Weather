//
//  ProxyLounchViewModel.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation

protocol ProxyLounchViewModelProtocol: BaseViewModelProtocol {
  
}

final class ProxyLounchViewModel:
  BaseViewModel <ProxyLounchRouter>,
  ProxyLounchViewModelProtocol {
  
}
