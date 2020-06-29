//
//  SearchViewController.swift
//  Weather
//
//  Created by Vladislav Horbenko on 29.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchBar = UISearchBar()
    private let citiesTableView = UITableView()
    private let searchVM = SearchViewModel()
    private let tableVM = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        setup()
        configure()
    }
    
    private func setup() {
        searchBar.delegate = searchVM
        searchVM.delegate = self
        citiesTableView.delegate = tableVM
        citiesTableView.dataSource = tableVM
        tableVM.delegate = self
    }

    private func configure() {
        
        view.setup(subView: searchBar) { (make) in
            make.width.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.setup(subView: citiesTableView) { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
        
    }
}

extension SearchViewController: SearchViewModelDelegate {
    
    func update() {
        citiesTableView.reloadData()
    }
}

extension SearchViewController: TableViewModelDelegate {

    var dataSource: [City] {
        return searchVM.fetchCities() ?? [City]()
    }
}
