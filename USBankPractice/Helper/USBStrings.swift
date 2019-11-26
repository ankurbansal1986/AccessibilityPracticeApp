//
//  USBStrings.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation

extension USBStrings {
    var localized: String {
        return self.rawValue.localized
    }
}


enum USBStrings: String {
    
    //MARK: - Login Screen
    case Hello
    case GladYouHere
    case Username
    case Password
    case RememberMe
    case LoginHelp
    case Login
    case CreateNewUserPass
    case NotAUser
    case ExloreLoansCard
    case TourApp
    
    case Opps
    case PleaseEnterUsername
    case PleaseEnterPassword
    case OK
    case FilledAlready
    case DoubleTapToSelect
}
