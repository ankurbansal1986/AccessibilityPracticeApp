//
//  CommonTableViewCell.swift
//  MVVMPracticeApplication
//
//  Created by Renu Devi on 21/11/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    static let reusableIdentifier: String = "CommonTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 8.0
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
