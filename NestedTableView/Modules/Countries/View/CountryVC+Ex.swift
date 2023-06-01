//
//  CountryVC+Ex.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit
import ExpandableCell


extension CountryVC: ExpandableDelegate {
    
    func numberOfSections(in tableView: ExpandableTableView) -> Int {
        return viewModel.numberOfCountries
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfExpandableCells(section: section)
    }
    
    
    // MARK: - Section Header -> Country
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = countryTableView.dequeueReusableHeaderFooterView(withIdentifier: "CountriesHeader") as? CountriesHeader else {return UIView()}
        
        header.vm = viewModel.getCountriesCellViewModel(section: section)
        return header
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    // MARK: - expandable -> City
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let IDs = viewModel.getIDs(section: indexPath.section)
        guard IDs != nil else {return UITableViewCell()}

        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: IDs![indexPath.row]) as? ExpandableCityCell else { return UITableViewCell() }
  
        cell.vm = viewModel.getCityCellViewModel(section: indexPath.section, index: indexPath.row)
    
        return cell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    
    // MARK: -expanded -> States
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        
        var cells = [UITableViewCell]()
        
        guard let states = viewModel.getStates(section: indexPath.section, index: indexPath.row) else {return [UITableViewCell()]}
        
        for state in states {
            let cell = countryTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
            cell.stateLbl.text = state.title ?? ""
            cells.append(cell)
        }
        
        return cells
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [40]
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? ExpandedCell {
            print("\(cell.stateLbl.text ?? "")")
        }
    }
    
    // MARK: - Expanding
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
