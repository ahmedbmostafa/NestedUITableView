//
//  NestedTableViewTests.swift
//  NestedTableViewTests
//
//  Created by AhmedHD_SL on 02/06/2023.
//

import XCTest
@testable import NestedTableView

class NestedTableViewTests: XCTestCase {
    
    var dataProvider: MockCountryDataProvider!
    var viewModel: CountryViewModel!
    var view = MockCountryVC()
    
    override func setUp() {
        super.setUp()
        dataProvider = MockCountryDataProvider()
        viewModel = CountryViewModel(withDataProvider: dataProvider)
        dataProvider.delegate = viewModel
        view.viewModel = viewModel
        view.bindViewModelOutput()
    }
    
    override func tearDown() {
        super.tearDown()
        dataProvider = nil
        viewModel = nil
    }
    
    func testGetCountryMethod() {
        dataProviderCall()
        viewModel.didLoad()
        let cellViewModel = viewModel.getCountriesCellViewModel(section: 0)
        XCTAssert(cellViewModel.countryTitle == "Kuwait")
    }
    
    func testNumberOfCountries() {
        dataProviderCall()
        viewModel.didLoad()
        XCTAssert(viewModel.numberOfCountries == 1)
    }
    
    func testGetCityMethod() {
        dataProviderCall()
        viewModel.didLoad()
        let cellViewModel = viewModel.getCityCellViewModel(section: 0, index: 0)
        XCTAssert(cellViewModel.cityTitle == "Alfarwanya")
    }
    
    func testNumberOfCities() {
        dataProviderCall()
        viewModel.didLoad()
        XCTAssert(viewModel.getNumberOfExpandableCells(section: 0) == 1)
    }
    
    func testGetStateMethod() {
        dataProviderCall()
        viewModel.didLoad()
        let state = viewModel.getStates(section: 0, index: 0)?.first
        XCTAssert(state?.title == "Abraq  khaitan")
    }
    
    func testNumberOfStates() {
        dataProviderCall()
        viewModel.didLoad()
        XCTAssert(viewModel.getStates(section: 0, index: 0)?.count == 1)
    }
    
    func dataProviderCall() {
        dataProvider.closure = {
            let countries = try! JSONDecoder().decode(CountryResponseModel.self, from: CountryStub)
            self.dataProvider.delegate?.onSuccess(countries)
        }
    }
    
}
