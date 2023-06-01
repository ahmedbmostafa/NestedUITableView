//
//  Configuration.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import Foundation

func valueOfSecret(named keyname:String) -> String {
    let filePath = Bundle.main.path(forResource: "SecretKeys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    let value = plist?.object(forKey: keyname) as! String
    return value
}
