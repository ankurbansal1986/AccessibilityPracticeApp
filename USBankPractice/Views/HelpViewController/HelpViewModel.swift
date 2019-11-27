//
//  HelpViewModel.swift
//  USBankPractice
//
//  Created by Ankur Bansal on 27/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation
class HelpViewModel {
    
    //MARK:- Properties
    //MARK:- Public
    
    
    weak var delegate: HomeViewModelDelegate? = nil
    
    var numberOfSection: Int {
        
        return 2
    }
    
    var guidedHelpArray:[String]! = [NSLocalizedString("Get help sending money", comment: "Get help sending money"), NSLocalizedString("Get help requesting money", comment: "Get help sending money"), NSLocalizedString("Get help splitting bill", comment: "Get help sending money")]
    
    var helpOptionsArray:[String]! = [NSLocalizedString("How do I send money to a person", comment: "Get help sending money"), NSLocalizedString("How do I check my message", comment: "Get help sending money"), NSLocalizedString("How can I increase security on my smartphone or tablet", comment: "Get help sending money")]
    
    var helpOptionsFilteredArray:[String]! = [NSLocalizedString("How do I send money to a person", comment: "Get help sending money"), NSLocalizedString("How do I check my message", comment: "Get help sending money"), NSLocalizedString("How can I increase security on my smartphone or tablet", comment: "Get help sending money")]
}
