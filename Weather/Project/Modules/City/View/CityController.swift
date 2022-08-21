//
//  CityController.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

final class CityController: BaseViewController<CityControllerView, CityViewModelProtocol> {
  
  // MARK: - Properties
  
  private weak var activityIndicator: ActivityIndicatorView?
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
  }
  
  // MARK: - Private functions
  
  private func configure() {
    let `view` = contentView
    
    activityIndicator = view.activivtyIndicatorView.addActivityIndicatorView(bgColor: .white)
    
    view.titleLabel.text = viewModel.country
    view.tableView.delegate = self
    view.tableView.dataSource = self
    view.tableView.register(
      WeatherTableViewCell.nib(),
      forCellReuseIdentifier: WeatherTableViewCell.nibName()
    )
    
    view.backButton.addTarget(
      self,
      action: #selector(onBack),
      for: .touchUpInside
    )
    
    viewModel.animateActivityCallBack = { [weak activityIndicator] isOn in
      
      DispatchQueue.main.async {
        isOn ?
        activityIndicator?.startAnimating() :
        activityIndicator?.stopAnimating()
      }
    }
    
    viewModel.updateTableCallBack = {
      DispatchQueue.main.async {
        view.tableView.reloadData()
      }
    }
  }
  
  @objc
  private func onBack() {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CityController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    viewModel.datasurce.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: WeatherTableViewCell.nibName()
    ) as? WeatherTableViewCell else {
      fatalError("Not expectable type of cell")
    }
    
    let model = viewModel.datasurce[indexPath.row]
    cell.setup(with: model)
    
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    CGFloat(viewModel.datasurce[indexPath.row].height)
  }
}
