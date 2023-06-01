//
//  CityCellViewModel.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Foundation

class CityCellViewModel {
   
    var cityTitle: String?
    var city: CountryModel?
    
    init(_ city: CountryModel?){
        self.city = city
        self.cityTitle = city?.title ?? ""
    }
    
}
