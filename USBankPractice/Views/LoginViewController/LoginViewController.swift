//
//  LoginViewController.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   
    
   
    
   
    
  
    
    //MARK:- Properties
    //MARK:- Public
    let viewModel = LoginViewModel()
    
    //MARK:- View Controller Life Cycle
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    
   
    
    
    
    @IBAction private func onTapLoginHelp(_ sender: CustomButton) {
       showLoginHelpOptions()
    }
    
    @IBAction private func onTapLogin(_ sender: CustomButton) {
        //go for the login process
        view.endEditing(true)
        viewModel.loginUser(fromViewController: self)
    }
    
    
    
    @IBAction private func onTapCreateUserPassButton(_ sender: CustomButton) {
        printDebug("createUserPassButtonAction")
    }
    
    @IBAction private func onTapExploreLoans(_ sender: CustomButton) {
        printDebug("exploreLoansButtonAction")
    }
    
    @IBAction private func onTapTourApp(_ sender: CustomButton) {
        printDebug("tourAppButtonAction")
    }
    
    private func showLoginHelpOptions() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Forgot username?", style: .default, handler: { (action) in
            print("Forgot username")
        }))
        
        alertController.addAction(UIAlertAction(title: "Reset password?", style: .default, handler: { (action) in
            print("Reset Password")
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

//MARK:- Extension for Text Field Delegate Methods
//MARK:-
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
