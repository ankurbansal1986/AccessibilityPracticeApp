//
//  LoginViewModel.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel {
    
    //MARK:- Properties
    //MARK:- Public
    var user: User = User()
    
    init() {
        //set the remembred user data in to the property user
        if let usr = try? AppUserDefaults.object(objectType: User.self, forKey: .loggedInUser) {
            user = usr
        }
    }
    
    //MARK:- Private
    private func isDataValid(fromViewController: UIViewController) -> Bool {
        //validate is user entred all required data.
        
        var flag: Bool = true
        
        if user.userName.isEmpty {
            flag = false
            fromViewController.showAlert(title: USBStrings.Opps.localized, message: USBStrings.PleaseEnterUsername.localized, buttonTitle: USBStrings.OK.localized, onCompletion: nil)
        }
        else if user.password.isEmpty {
            fromViewController.showAlert(title: USBStrings.Opps.localized, message: USBStrings.PleaseEnterPassword.localized, buttonTitle: USBStrings.OK.localized, onCompletion: nil)
            flag = false
        }
        
        return flag
    }
    
    //MARK:- Methods
    //MARK:- Private
    
    //MARK:- Public
    func loginUser(fromViewController: UIViewController) {
        
        //check if all data entred by user
        if isDataValid(fromViewController: fromViewController) {

            if user.rememberMe {
                //if user wants to remembere
                try! AppUserDefaults.save(object: user, forKey: .loggedInUser)
            }
            else {
                //if user don't want to remembere
                AppUserDefaults.removeValue(forKey: .loggedInUser)
            }
            
            //make user logged in by setting true at key isSignin in userdefaults
            AppUserDefaults.save(value: true, forKey: .isSignin)
            AppNavigationManager.default.setupInitialFlow()
        }
    }
}
