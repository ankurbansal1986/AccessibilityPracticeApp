//
//  HelpViewController+TableViewHelper.swift
//  USBankPractice
//
//  Created by Ankur Bansal on 27/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit

extension HelpViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows:Int = 0
        switch section {
        case 0:
            numberOfRows = viewModel.helpOptionsFilteredArray.count
        case 1:
            numberOfRows = viewModel.guidedHelpArray.count
        default:
            numberOfRows = 0
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        if(indexPath.section == 0){
            let helpOptionTableViewCell:HelpOptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: HelpOptionTableViewCell.reusableIdentifier, for: indexPath) as! HelpOptionTableViewCell
            helpOptionTableViewCell.showData(helpOption: viewModel.helpOptionsFilteredArray[indexPath.row])
            cell = helpOptionTableViewCell
        }
        if(indexPath.section == 1){
            let guidedHelpTableViewCell:GuidedHelpTableViewCell = tableView.dequeueReusableCell(withIdentifier: GuidedHelpTableViewCell.reusableIdentifier, for: indexPath) as! GuidedHelpTableViewCell
            guidedHelpTableViewCell.showData(helpOption: viewModel.helpOptionsFilteredArray[indexPath.row])
            cell = guidedHelpTableViewCell
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let helpSectionHeaderView:HelpSectionHeaderView = UINib(nibName: "HelpSectionHeaderView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! HelpSectionHeaderView
      
        if(section == 0){
             helpSectionHeaderView.showData(heading: NSLocalizedString("Get more information about:", comment: "Get more information about:"))
        }
        if(section == 1){
            helpSectionHeaderView.showData(heading: NSLocalizedString("Guided Help", comment: "Guided Help"))
        }
       
        
        return helpSectionHeaderView
    }
}
