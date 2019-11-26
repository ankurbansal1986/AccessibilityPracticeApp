//
//  CommonTableViewCell.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 21/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    //MARK:-
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextButton: CustomButton!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    static let reusableIdentifier: String = "CommonTableViewCell"
    
    //MARK:- Cell Life Cycle
    //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 8.0
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Methods
    //MARK:- Public
    func configureData(transection: Transaction) {
        self.detailLabel.text = transection.title
        
        let amountStr = "\(AppConstant.currentCurrency)\(transection.price)"
        self.amountLabel.text = amountStr
        self.nextButton.setTitle(amountStr, for: .normal)
        
    }

}
