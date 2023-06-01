//
//  EndPoint.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Alamofire

enum EndPoint {
    case fetchCountries
}

extension EndPoint: TargetType {
    
    var base: String {
        switch self {
        default:
            return valueOfSecret(named: "BaseURL")
        }
    }
    var path: String {
        switch self {
        case .fetchCountries:
            return "areas/countries-with-cities-and-states"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchCountries:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchCountries:
            return .requestPlain
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        default:
            let header: HTTPHeaders = ["Content-Type": "application/json; charset=utf-8"]
            return header
        }
    }
    
}
