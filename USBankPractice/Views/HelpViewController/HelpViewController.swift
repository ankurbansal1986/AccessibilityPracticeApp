//
//  HelpViewController.swift
//  USBankPractice
//
//  Created by Ankur Bansal on 27/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
     private(set) var viewModel = HelpViewModel()
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBar:UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
         registerTableViewCell()
        customization()
        // Do any additional setup after loading the view.
    }
    
    func customization(){
       
       
    }

    func registerTableViewCell(){
         tableView.register(UINib(nibName: HelpOptionTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: HelpOptionTableViewCell.reusableIdentifier)
        tableView.register(UINib(nibName: GuidedHelpTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: GuidedHelpTableViewCell.reusableIdentifier)
    }

}
