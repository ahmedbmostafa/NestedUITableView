//
//  CountryService.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Alamofire

protocol CountryServiceProtocol {
    func fetchCountries(completion: @escaping (Result<CountryResponseModel?, AFError>) -> Void)
}

class CountryServiceImp: BaseAPI<EndPoint>, CountryServiceProtocol {
    
    func fetchCountries(completion: @escaping (Result<CountryResponseModel?, AFError>) -> Void) {
        self.fetchCountries(target: .fetchCountries) { (result) in
            completion(result)
        }
    }
}
