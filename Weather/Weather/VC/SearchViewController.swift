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
        view.backgroundColor = UIColor.fetch(color: .darkBlue)
        
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
        searchBar.barTintColor = UIColor.fetch(color: .darkBlue)
        
        view.setup(subView: citiesTableView) { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
        
        citiesTableView.backgroundColor = .white
    }
}

extension SearchViewController: SearchViewModelDelegate {
    
    func update() {
        citiesTableView.reloadData()
    }
}

extension SearchViewController: TableViewModelDelegate {
    func didPressedCell(city: City) {
        NetworkService.fetchWeather(city: city, forecast: .hourly, complition: { (result) in
            switch result {
            case .success(let res):
                let vc = WeatherViewController()
                vc.weather = res
                vc.city = city
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            case .error(let err):
                self.showInfo(with: err)
            }
        })
    }
    
    var dataSource: [City] {
        return searchVM.fetchCities() ?? [City]()
    }
}
