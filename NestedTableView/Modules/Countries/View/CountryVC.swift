//
//  ViewController.swift
//  NestedTableView
//
//  Created by AhmedHD_SL on 01/06/2023.
//

import UIKit
import ExpandableCell

class CountryVC: UIViewController {

    @IBOutlet weak var countryTableView: ExpandableTableView!
    
    var reachabilityController:ReachabilityController!
    var viewModel: CountryViewModelProtocol!
    var cell: UITableViewCell {
        return countryTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        checkAppLang()
        checkReachability()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        bindViewModelOutput()
        viewModel.didLoad()
    }

    func setUpTableView() {
        countryTableView.expandableDelegate = self
        countryTableView.animation = .automatic
        
        countryTableView.registerNib(identifier: "ExpandedCell")
        countryTableView.registerNib(identifier: "ExpandableCell")
        countryTableView.registerNibForHeaderFooter(identifier: "CountriesHeader")
    }
    
    func checkAppLang() {
        let lang = Locale.preferredLanguages.first
        if lang == "ar"{
            countryTableView.semanticContentAttribute = .forceRightToLeft
        }
    }

    func checkReachability() {
        // the best experience is with real device
        reachabilityController = ReachabilityController(viewController: self)
        reachabilityController.handleConnectivityToInternet()
    }
    
    func bindViewModelOutput() {
        viewModel.output = { output in
            switch output {
            case .reloadCountries:
                self.countryTableView.reloadData()
            case .showActivityIndicator(let show):
                show ? self.startAnimating() : self.stopAnimating()
            case .showError(let error):
                print(error.localizedDescription)
                UIAlertController.showAlert(withMessage: error.localizedDescription)
            }
        }
    }
}

