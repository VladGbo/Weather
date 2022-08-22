//
//  HomeController.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

final class HomeController: BaseViewController<HomeControllerView, HomeViewModelProtocol> {
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
  }
  
  // MARK: Private functions
  
  private func configure() {
    let `view` = contentView
    
    view.tableView.delegate = self
    view.tableView.dataSource = self
    view.tableView.separatorStyle = .none
    
    view.tableView.register(
      CityTableViewCell.nib(),
      forCellReuseIdentifier: CityTableViewCell.nibName()
    )
    
    view.textField.delegate = self
    
    makeBorder(for: view.searchView)
    
    view.textField.addTarget(
      self,
      action: #selector(searchTextWasChanged(_:)),
      for: .editingChanged
    )
    
    view.searchButton.addTarget(
      self,
      action: #selector(onSearch),
      for: .touchUpInside
    )
    
    viewModel.updateTableCallBack = {
      DispatchQueue.main.async {
        view.tableView.reloadData()
      }
    }
  }
  
  @objc
  private func onSearch() {
    contentView.textField.becomeFirstResponder()
  }
  
  @objc
  private func searchTextWasChanged(_ textField: UITextField) {
    let searchText = textField.text
    viewModel.updateSearchCities(searchText)
  }
  
  private func makeBorder(for internalView: UIView) {
    internalView.layer.cornerRadius = 12.0
    internalView.layer.borderWidth = 3.0
    internalView.layer.borderColor = UIColor.black.cgColor
    internalView.clipsToBounds = true
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    viewModel.dataSource.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: CityTableViewCell.nibName()
    ) as? CityTableViewCell else {
      fatalError("Not expectable type of cell")
    }
    
    let model = viewModel.dataSource[indexPath.row]
    
    cell.setup(with: model)
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    CGFloat(viewModel.dataSource[indexPath.row].height)
  }
}

// MARK: - UITextFieldDelegate

extension HomeController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == contentView.textField {
      contentView.endEditing(true)
    }
    
    return true
  }
}
