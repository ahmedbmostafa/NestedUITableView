//
//  DataProvider.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Alamofire

protocol CountryDataProviderDelegate: AnyObject {
    func onSuccess(_ countries: CountryResponseModel)
    func onFailure(_ error: AFError)
    func showLoader(show: Bool)
}

protocol CountryDataProviderProtocol {
    func fetchCountries()
    var delegate: CountryDataProviderDelegate? { get set }
}

class CountryDataProviderImpl: CountryDataProviderProtocol {
    
    var countryService: CountryServiceProtocol!
    
    private var isFetching = false
    
    weak var delegate: CountryDataProviderDelegate?
    
    func fetchCountries() {
        isFetching = true
        delegate?.showLoader(show: isFetching)
        countryService.fetchCountries { [weak self] result in
            guard let self = self else { return }
            self.isFetching = false
            self.delegate?.showLoader(show: self.isFetching)
            
            switch result {
            case .success(let results):
                guard let data = results else { return }
                self.delegate?.onSuccess(data)
            case .failure(let error):
                self.delegate?.onFailure(error)
            }
        }
    }
}
