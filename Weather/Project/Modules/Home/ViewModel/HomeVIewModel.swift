//
//  HomeVIewModel.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 20.08.2022.
//

import Foundation

protocol HomeViewModelProtocol {
  
  var dataSource: [CityTableViewCellProtocol] { get }
  var updateTableCallBack: VoidCallBack? { get set }
  
  func updateSearchCities(_ searchText: String?)
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewModelProtocol {
  
  // MARK: - Properties
  
  var dataSource: [CityTableViewCellProtocol] {
    isSearched ?
    searhedCities :
    cityCellModels
  }
  
  var updateTableCallBack: VoidCallBack?
  
  private var cityCellModels: [CityTableViewCellProtocol] = .init()
  private let cities: [City] = [
    City(name: "London", id: "2643743", coord: (-0.12574, 51.50853)),
    City(name: "Tel Aviv District", id: "293396", coord: (34.799999, 32.083328)),
    City(name: "New York City", id: "5128581", coord: (-74.005966, 40.714272)),
    City(name: "Brussels", id: "2800866", coord: (4.34878, 50.850449)),
    City(name: "Barcelona", id: "3128760", coord: (2.15899, 41.38879)),
    City(name: "Paris", id: "2988507", coord: (2.3488, 48.853409)),
    City(name: "Tokyo", id: "1850147", coord: (139.691711, 35.689499)),
    City(name: "Beijing", id: "1816670", coord: (116.397232, 39.907501)),
    City(name: "Sydney", id: "2147714", coord: (151.207321, -33.867851)),
    City(name: "Buenos Aires", id: "3435907", coord: (-60.0, -36.0)),
    City(name: "Miami", id: "4164138", coord: (-80.193657, 25.774269)),
    City(name: "Vancouver", id: "6173331", coord: (-123.119339, 49.24966)),
    City(name: "Moscow", id: "524901", coord: (37.615555, 55.75222)),
    City(name: "Bangkok", id: "1609350", coord: (100.51667, 13.75)),
    City(name: "Johannesburg", id: "993800", coord: (28.043631, -26.202271)),
    City(name: "Tunis", id: "2464470", coord: (10.16579, 36.81897)),
    City(name: "Manila", id: "1701668", coord: (120.982201, 14.6042))
  ]
  
  private var isSearched: Bool {
    searchText != nil && searchText?.count ?? .zero > .zero
  }
  
  private var searhedCities: [CityTableViewCellProtocol] = .init()
  private var searchText: String?
  
  // MARK: - Init
  
  override init(router: HomeRouter) {
    super.init(router: router)
    
    cityCellModels = cities
      .map({ city in
        let model = CityTableViewCellViewModel(city: city)
        
        model.onCellCallBack = { [weak router] city in
          DispatchQueue.main.async {
            router?.openCity(city)
          }
        }
        
        return model
      })
    

  }
  
  // MARK: - Open functions
  
  func updateSearchCities(_ searchText: String?) {
    self.searchText = searchText
    
    guard let searchText = searchText?.lowercased() else {
      return
    }
    
    searhedCities = cityCellModels.filter{( $0.country.lowercased().contains(searchText) )}
    updateTableCallBack?()
  }
}
