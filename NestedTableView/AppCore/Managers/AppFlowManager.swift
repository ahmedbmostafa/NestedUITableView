//
//  AppFlowManager.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit


class AppFlowManager {

    func start(navigationController: UINavigationController) {
        let vc = creatCountryVC()
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AppFlowManager {
    
    func creatCountryVC() -> UIViewController {
        let countryVC = CountryVC.instantiate(fromAppStoryboard: .Main)
        let dataProvider = CountryDataProviderImpl()
        dataProvider.countryService = CountryServiceImp()
        let viewModel = CountryViewModel(withDataProvider: dataProvider)
        dataProvider.delegate = viewModel
        viewModel.dataProvider = dataProvider
        countryVC.viewModel = viewModel
        return countryVC
    }
}
