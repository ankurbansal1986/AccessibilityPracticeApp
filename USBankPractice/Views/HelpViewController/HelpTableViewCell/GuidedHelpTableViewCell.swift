//
//  CommonTableViewCell.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 21/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class GuidedHelpTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    //MARK:-
    @IBOutlet weak var label: UILabel!
    
    
    static let reusableIdentifier: String = "GuidedHelpTableViewCell"
    
    //MARK:- Cell Life Cycle
    //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK:- Methods
    //MARK:- Public
    func showData(helpOption: String) {
        label.text = helpOption
    }
    
}
