//
//  City.swift
//  Weather
//
//  Created by Vladislav Horbenko on 28.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation


struct City: Codable {
    
    let id: Int
    let name: String
    let state: String
    let country: String
    let coord: Coord
    
}

struct Coord: Codable {
        let lon: Double
        let lat: Double
}
