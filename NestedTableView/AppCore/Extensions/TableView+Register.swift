//
//  TableView+Register.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit

extension UITableView {
    func registerNib(identifier: String) {
         let tableNib = UINib(nibName: identifier, bundle: nil)
         self.register(tableNib, forCellReuseIdentifier: identifier )
     }
    
    func registerNibForHeaderFooter(identifier: String) {
         let tableNib = UINib(nibName: identifier, bundle: nil)
         self.register(tableNib, forHeaderFooterViewReuseIdentifier: identifier )
     }
    
}
