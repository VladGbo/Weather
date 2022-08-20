//
//  ActivityIndicatorView.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

class ActivityIndicatorView: UIView {
  
  // MARK: - Properties
  
  private let indicator: UIActivityIndicatorView = {
    if #available(iOS 13.0, *) {
      return UIActivityIndicatorView(style: .medium)
    } else {
      return UIActivityIndicatorView(style: .gray)
    }
  }()
  
  private let indicatorContainer = UIView()
  
  open var animationDuration: TimeInterval = 0.2
  
  // MARK: - Init
  
  init(bgColor: UIColor) {
    super.init(frame: .zero)
    
    indicatorContainer.backgroundColor = bgColor
    indicatorContainer.translatesAutoresizingMaskIntoConstraints = false
    indicatorContainer.addSubview(indicator)
    
    addSubview(indicatorContainer)
    indicatorContainer.pinEdges(to: self)
    
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.centerXAnchor.constraint(equalTo: indicatorContainer.centerXAnchor).isActive = true
    indicator.centerYAnchor.constraint(equalTo: indicatorContainer.centerYAnchor).isActive = true
    indicator.hidesWhenStopped = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("Is not implemented")
  }
  
  // MARK: - Open functions
  
  func startAnimating() {
    isHidden = false
    UIView.animate(
      withDuration: animationDuration) { [weak self] in
        self?.alpha = 1
        self?.indicator.startAnimating()
      }
  }
  
  func stopAnimating() {
    UIView.animate(
      withDuration: animationDuration,
      animations: { [weak self] in
        self?.alpha = .zero
      },
      completion: { [weak self] _ in
        self?.indicator.stopAnimating()
        self?.isHidden = true
      }
    )
  }
}

