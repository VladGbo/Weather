//
//  RequestParameters.swift
//  Weather
//
//  Created by Vladislav Horbenko on 27.06.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import Foundation
import Alamofire

struct RequestParameters {
    let url: URLConvertible
    let method: HTTPMethod
    var parameters: Parameters?
    var header: HTTPHeaders?
    
}
