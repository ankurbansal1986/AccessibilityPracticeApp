//
//  AppUserDefaults.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//


import Foundation

enum AppUserDefaults { }

extension AppUserDefaults {
    
    static func value(forKey key: Key,
                      file : String = #file,
                      line : Int = #line,
                      function : String = #function) -> Any? {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) as? Any else {
            
            printDebug("No Value Found in UserDefaults\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
            
            return nil
        }
        
        return value
    }
    
    static func value<T>(forKey key: Key,
                      fallBackValue : T,
                      file : String = #file,
                      line : Int = #line,
                      function : String = #function) -> Any? {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) as? Any else {
            
            printDebug("No Value Found in UserDefaults\nFile : \(file) \nFunction : \(function)")
            return nil
        }
        
        return value
    }
    
    static func save(value : Any, forKey key : Key) {
        
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
    static func save<T: Codable>(object: T, forKey: Key) throws {
        
        let jsonData = try JSONEncoder().encode(object)
        
        AppUserDefaults.save(value: jsonData, forKey: forKey)
        
    }
    
    static func object<T: Codable>(objectType: T.Type, forKey: Key) throws -> T? {
        
        guard let result = AppUserDefaults.value(forKey: forKey) as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(objectType, from: result)
    }
    
    static func removeValue(forKey key : Key) {
        
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeAllValues() {
        
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
}


extension AppUserDefaults {
    
    enum Key : String {
        
        case loggedInUser
        case isSignin
    }
}



