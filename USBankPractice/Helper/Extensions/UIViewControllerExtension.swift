//
//  UIViewControllerExtension.swift
//
//  Created by Pramod Kumar on 19/09/17.
//  Copyright © 2017 Pramod Kumar. All rights reserved.
//


import Foundation
import UIKit
import AssetsLibrary
import AVFoundation
import Photos
import PhotosUI
import Contacts

extension UIViewController{
    
    func showAlert(title: String, message: String, successButtonTitle: String, cancelButtonTitle: String, onCompletion completion: @escaping (Bool)->Void){
        
        let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title:successButtonTitle, style: .default) { (_) -> Void in
            completion(true)
        }
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .destructive) { (_) in
            completion(false)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        self.present(alertController, animated: true, completion: nil);
    }
    
    func showAlert(title: String, message:String, buttonTitle: String, onCompletion completion: (()->Void)?){
        
        let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title:buttonTitle, style: .cancel) { (_) -> Void in
            completion?()
        }
        alertController.addAction(doneAction)
        self.present(alertController, animated: true, completion: nil);
    }
    
    func showActionSheet(title: String, btnTitleArray: [String], completion: @escaping (_ btnTag: Int) -> ()) {
        let alert = UIAlertController.init(title: title, message: nil, preferredStyle: .actionSheet)
        
        for titleString in btnTitleArray {
            
            let alertAction = UIAlertAction.init(title: titleString, style: .default, handler: { (action) in
                
                for i in 0..<btnTitleArray.count {
                    
                    if titleString == btnTitleArray[i] {
                        completion(i)
                    }
                }
            })
            
            alert.addAction(alertAction)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
