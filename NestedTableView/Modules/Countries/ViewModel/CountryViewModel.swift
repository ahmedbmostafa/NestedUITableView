//
//  CountryViewModel.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Foundation
import Alamofire

typealias CountryViewModelOutput = (CountryViewModel.Output) -> ()

protocol CountryViewModelProtocol {
    var dataProvider: CountryDataProviderProtocol! {get}
    var output: CountryViewModelOutput? { get set }
    var numberOfCountries: Int { get }
    func getCountriesCellViewModel(section : Int) -> CountryCellViewModel
    func getNumberOfExpandableCells(section : Int) -> Int
    func getIDs(section: Int) -> [String]?
    func getCityCellViewModel(section : Int, index: Int) -> CityCellViewModel
    func getStates(section: Int, index: Int) -> [CountryModel]?
    func didLoad()
}

class CountryViewModel: CountryViewModelProtocol {
    
    enum Output {
        case reloadCountries
        case showActivityIndicator(show: Bool)
        case showError(error: Error)
    }
    
    var dataProvider: CountryDataProviderProtocol!
    
    init(withDataProvider dataProvider: CountryDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    var output: CountryViewModelOutput?
    
    private var allCountriesViewModels = [CountryCellViewModel]() {
        didSet {
            output?(.reloadCountries)
        }
    }
    
    private var countriesDataSourceViewModels: [CountryCellViewModel] {
        allCountriesViewModels
    }
    
    var numberOfCountries: Int {
        countriesDataSourceViewModels.count
    }
    
    func getCountriesCellViewModel(section: Int) -> CountryCellViewModel {
        countriesDataSourceViewModels[section]
    }
    
    private func getCities(section: Int) -> [CountryModel]? {
        getCountriesCellViewModel(section: section).country?.cities
    }
    
    func getNumberOfExpandableCells(section: Int) -> Int {
        getCities(section: section)?.count ?? 0
    }
    
    private var IDs = [String]()
    private var id = "ExpandableCell"
    
    func getIDs(section: Int) -> [String]? {
        guard let cities = getCities(section: section) else {return nil}
        for _ in cities {
            IDs.append(id)
        }
        return IDs
    }
    
    func getCityCellViewModel(section: Int, index: Int) -> CityCellViewModel {
        CityCellViewModel(getCities(section: section)?[index])
    }
    
    func getStates(section: Int, index: Int) -> [CountryModel]? {
        getCities(section: section)?[index].states
    }
    
    func didLoad() {
        fetchCountries()
    }
    
    private func fetchCountries(){
        dataProvider.fetchCountries()
    }
    
}

extension CountryViewModel: CountryDataProviderDelegate {
    
    func showLoader(show: Bool) {
        output?(.showActivityIndicator(show: show))
    }
    
    func onSuccess(_ countries: CountryResponseModel) {
        guard let countries = countries.data else {return}
        allCountriesViewModels.append(contentsOf: countries.map {CountryCellViewModel.init($0)})
    }
    
    func onFailure(_ error: AFError) {
        output?(.showError(error: error))
    }
}
