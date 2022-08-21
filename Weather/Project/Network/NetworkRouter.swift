//
//  NetworkRouter.swift
//  Weather
//
//  Created by Vladyslav Horbenko on 22.08.2022.
//

import Foundation
import Alamofire

enum NetworResult<T: Decodable> {
  case succes(object: T)
  case error(error: String)
}

class NetworkRouter {
  
  
  static func request<T: Decodable>(
    route: EndPoint,
    completion: @escaping ((NetworResult<T>) -> Void)
  ) {
    
    let request = AF.request(
      route.fullPath,
      method: route.method,
      parameters: route.parameters,
      encoding: JSONEncoding.default,
      headers: route.headers
    )
    
    request.responseDecodable(of: T.self) { response in
      switch response.result  {
      case .success(let object):
        completion(.succes(object: object))
      case .failure(let error):
        completion(.error(error: error.localizedDescription))
      }
    }
  }
}
