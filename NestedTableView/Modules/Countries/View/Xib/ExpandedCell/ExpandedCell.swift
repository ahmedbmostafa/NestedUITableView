//
//  ExpandedCell.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit
import ExpandableCell

class ExpandedCell: UITableViewCell {
    
    @IBOutlet weak var stateLbl: UILabel!
    
    static let ID = "ExpandedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkAppLang()
    }
    
    func checkAppLang() {
        let lang = Locale.preferredLanguages.first
        if lang == "ar"{
            stateLbl.textAlignment = .right
        }
    }
    
}
