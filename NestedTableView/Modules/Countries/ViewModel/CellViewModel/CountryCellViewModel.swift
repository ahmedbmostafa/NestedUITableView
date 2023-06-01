//
//  CountriesCellViewModel.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Foundation

class CountryCellViewModel {
   
    var countryTitle: String?
    var country: CountryModel?
    
    init(_ country: CountryModel?){
        self.country = country
        self.countryTitle = country?.title ?? ""
    }
    
}
