//
//  HomeControllerView.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import UIKit

final class HomeControllerView: BaseView {
  
  // MARK: - Outlets
  
  @IBOutlet private(set) weak var searchView: UIView!
  @IBOutlet private(set) weak var textField: UITextField!
  @IBOutlet private(set) weak var searchButton: UIButton!
  @IBOutlet private(set) weak var tableView: UITableView!
}
