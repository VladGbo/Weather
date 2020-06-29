//
//  CitiesService.swift
//  Weather
//
//  Created by Vladislav Horbenko on 28.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation

class CitiesService {
    
    var cities: [City]?
    
    
    static let shared = CitiesService()
    private init() {}
    
    func fetchCities() {
        let path = Bundle.main.path(forResource: "city", ofType: "json")!
        do {
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            cities = try JSONDecoder().decode([City].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
