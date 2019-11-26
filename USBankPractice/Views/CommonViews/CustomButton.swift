//
//  CustomButton.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 22/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customization()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customization()
    }
    
    func customization() -> Void {
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.textAlignment = .center
        
        if let ttlLbl = titleLabel {
            let leadingConstraint = NSLayoutConstraint(item: ttlLbl, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: ttlLbl, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: ttlLbl, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: ttlLbl, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        }
    }
}
