//
//  Base.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchCountries (target: T, completion: @escaping(Result<CountryResponseModel?, AFError>) -> Void) {
        let method = HTTPMethod(rawValue: target.method.rawValue)
        print("URL=", target.base + target.path)
        AF.request(target.base + target.path, method: method, encoding: JSONEncoding.default, headers: target.headers)
            .response { response in
                switch response.result {
                case.success:
                    guard let data = response.value else {return}
                    do {
                        let responseOBj = try JSONDecoder().decode(CountryResponseModel.self, from: data!)
                        completion(.success(responseOBj))
                    }
                    catch let err{
                        debugPrint(err)
                    }
                case .failure(let err):
                    debugPrint(err)
                    completion(.failure(err))
                }
            }
    }
}
