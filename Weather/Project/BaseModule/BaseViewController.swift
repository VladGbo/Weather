//
//  BaseViewController.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

class BaseViewController<ViewType: BaseView, ViewModelType>: UIViewController {
  
  // MARK: - Properties
  
  let viewModel: ViewModelType
  let contentView: ViewType
  
  // MARK: - Init
  
  init(viewModel: ViewModelType) {
    self.viewModel = viewModel
    contentView = .init()
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - LifeCycle
  
  override func loadView() {
    super.loadView()
    
    view = contentView
  }
  
  // MARK: - Open functions
  
  func addChild(_ childController: UIViewController, to container: UIView) {
    addChild(childController)
    
    childController.view.frame = container.bounds
    container.addSubview(childController.view)
    childController.didMove(toParent: self)
  }
}
