//
//  HelpSectionHeaderView.swift
//  USBankPractice
//
//  Created by Ankur Bansal on 27/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class HelpSectionHeaderView: UIView {
   @IBOutlet weak var label: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func showData(heading: String) {
        label.text = heading
    }

}
