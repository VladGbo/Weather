//
//  BaseView.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

class BaseView: UIView {
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    setup()
  }
  
  // MARK: - Private functions
  
  func setup() {
    let name = String(describing: type(of: self))
    let nib = UINib(nibName: name, bundle: nil)
    
    guard let view = nib.instantiate(
      withOwner: self,
      options: nil
    ).first as? UIView else { return }
    
    view.frame = bounds
    view.autoresizingMask = [
      .flexibleWidth,
      .flexibleHeight
    ]
    addSubview(view)
  }
}
