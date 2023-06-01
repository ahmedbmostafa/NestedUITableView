//
//  MockCountryVC.swift
//  NestedTableViewTests
//
//  Created by AhmedHD_SL on 02/06/2023.
//

import XCTest
@testable import NestedTableView

class MockCountryVC: CountryVC {
    
    var isShowLoaderCalls = false
    var isReloadCalls = false
    var isShowErrorCalls = false
    
    override func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .reloadCountries:
                self.isReloadCalls = true
            case .showActivityIndicator( _):
                self.isShowLoaderCalls = true
            case .showError( _):
                self.isShowErrorCalls = true
            }
        }
    }
    
}
