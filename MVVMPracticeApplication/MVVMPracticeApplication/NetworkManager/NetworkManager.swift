//
//  CommonTableViewCell.swift
//  MVVMPracticeApplication
//
//  Created by Renu Devi on 21/11/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

struct NetworkManager {
    
    //MARK:- Properties
    //MARK:-
    static let shared = NetworkManager()
    
    
    //MARK:- Methods
    //MARK:- Private
    private init() {}
    
    //MARK:- Public
    func getHomeData(completion: ((Bool, AssetModel?) -> Void)) {
        guard let filePath = Bundle.main.path(forResource: "Data", ofType: "json"), let url = URL(string: filePath) else {
            completion(false, nil)
            return
        }
        
        
        printDebug(filePath)
        guard let jsonData = try? Data(contentsOf: url) else {
            completion(false, nil)
            return
        }
        
        let decoder = JSONDecoder()
        let assetM = try? decoder.decode(AssetModel.self, from: jsonData)
        
    }
}
