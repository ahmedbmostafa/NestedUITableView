//
//  CountriesHeader.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit

class CountriesHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var countryLbl: UILabel!
    
    var vm: CountryCellViewModel! {
        didSet {
            countryLbl.text = vm.countryTitle
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        checkAppLang()
    }
    
    func checkAppLang() {
        let lang = Locale.preferredLanguages.first
        if lang == "ar"{
            countryLbl.textAlignment = .right
        }
    }
}
