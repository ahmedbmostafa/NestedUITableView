//
//  ExpandableCell.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit
import ExpandableCell

class ExpandableCityCell: ExpandableCell {

    @IBOutlet weak var cityLbl: UILabel!
    
    static let ID = "ExpandableCell"
    var vm: CityCellViewModel! {
        didSet {
            cityLbl.text = vm.cityTitle ?? ""
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
  
}
