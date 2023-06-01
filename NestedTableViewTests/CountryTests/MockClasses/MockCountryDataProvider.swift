//
//  MockCountryDataProvider.swift
//  NestedTableViewTests
//
//  Created by AhmedHD_SL on 02/06/2023.
//

import XCTest
@testable import NestedTableView

class MockCountryDataProvider: CountryDataProviderProtocol {

    var delegate: CountryDataProviderDelegate?
    var closure: (() -> ())?
    func fetchCountries() {
        closure?()
    }
    
}
