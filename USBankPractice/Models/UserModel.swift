//
//  UserModel.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation


struct User: Codable {
    
    var userName: String = ""
    var password: String = ""
    var rememberMe: Bool = false
    
    enum CodingKeys : String,CodingKey {
        case userName
        case password
        case rememberMe
    }
    
    init() {
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.password = try container.decode(String.self, forKey: .password)
        self.rememberMe = try container.decode(Bool.self, forKey: .rememberMe)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userName, forKey: .userName)
        try container.encode(self.password, forKey: .password)
        try container.encode(self.rememberMe, forKey: .rememberMe)
    }
}
