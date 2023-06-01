//
//  CountryModel.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Foundation

struct CountryResponseModel: Codable {
    let success: Bool?
    let data: [CountryModel]?
    let message: String?
}

struct CountryModel: Codable {
    let id: Int?
    let title: String?
    let status: Int?
    let cities, states: [CountryModel]?
}
