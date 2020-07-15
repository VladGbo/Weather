//
//  TableViewModel.swift
//  Weather
//
//  Created by Vladislav Horbenko on 30.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

protocol TableViewModelDelegate: class {
    var dataSource: [City] { get }
    func didPressedCell(city: City)
}

class TableViewModel: NSObject {
    weak var delegate: TableViewModelDelegate?
}

extension TableViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return delegate?.dataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let data = delegate?.dataSource[indexPath.row] {
            let cell = UITableViewCell()
            cell.textLabel?.text = data.name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        guard let city = delegate?.dataSource[indexPath.row] else {return}
        delegate?.didPressedCell(city: city)
    }
}


