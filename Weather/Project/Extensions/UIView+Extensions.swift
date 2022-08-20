//
//  UIView+Extensions.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

extension UIView {
  
  @discardableResult
  func addActivityIndicatorView(bgColor: UIColor = .clear) -> ActivityIndicatorView {
    let indicator = ActivityIndicatorView(bgColor: bgColor)
    
    indicator.translatesAutoresizingMaskIntoConstraints = false
    addSubview(indicator)
    
    indicator.pinEdges(to: self)
    
    return indicator
  }
  
  func pinEdges(
    to other: UIView,
    side: [NSLayoutConstraint.Attribute] = [.top, .bottom, .right, .left]
  ) {
    let attributes: [NSLayoutConstraint.Attribute] = side
    NSLayoutConstraint.activate(attributes.map {
      NSLayoutConstraint(
        item: other,
        attribute: $0,
        relatedBy: .equal,
        toItem: self,
        attribute: $0,
        multiplier: 1,
        constant: 0
      )
    })
  }
  
}
