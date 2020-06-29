//
//  SearchViewModel.swift
//  Weather
//
//  Created by Vladislav Horbenko on 29.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

protocol SearchViewModelDelegate: class {
    func update()
}

class SearchViewModel: NSObject {
    
    private var isSearching = false
    
    private let cities = CitiesService.shared.cities
    private var filteredCities: [City]?
    weak var delegate: SearchViewModelDelegate?
    
    func fetchCities() -> [City]? {
        return isSearching ? filteredCities : cities
    }
}

extension SearchViewModel: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        isSearching = false
        searchBar.text = ""
        delegate?.update()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        isSearching = true
        filteredCities = cities?.filter({ $0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        delegate?.update()
    }
}
