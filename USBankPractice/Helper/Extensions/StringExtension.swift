//
//  StringExtension.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
