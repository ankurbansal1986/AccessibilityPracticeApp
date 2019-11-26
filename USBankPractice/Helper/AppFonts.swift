//
//  AppFonts.swift
//  USBankPractice
//
//  Created by Pramod Kumar on 25/11/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit

enum AppFonts: String {
    
    static let isDynamicFontEnabled: Bool = true
    
    case Light = "SourceSansPro-Light"
    case BoldItalic = "SourceSansPro-BoldItalic"
    case LightItalic = "SourceSansPro-LightItalic"
    case Regular = "SourceSansPro-Regular"
    case Italic = "SourceSansPro-Italic"
    case ExtraLight = "SourceSansPro-ExtraLight"
    case BlackItalic = "SourceSansPro-BlackItalic"
    case SemiBoldItalic = "SourceSansPro-SemiBoldItalic"
    case Bold = "SourceSansPro-Bold"
    case SemiBold = "SourceSansPro-SemiBold"
    case Black = "SourceSansPro-Black"
    case ExtraLightItalic = "SourceSansPro-ExtraLightItalic"
}

enum DeviceType {
    case iPhone5, iPhone6, iPhonePlusSize, iPadMini, iPad_10inch, iPad_12inch
}

extension AppFonts{
    
    func withSize(_ fontSize: CGFloat) -> UIFont {
        
        let name: String = self.rawValue
        var size: CGFloat = 0.0
        
        switch UIDevice.screenWidth {
            
        case let x where x < 321 :
            // For iPhone  5, 5s, 5c i.e. 320
            size = calculateSize(fontSize, .iPhone5)
            
        case let x where x < 376 :
            //For iPhone 6:  i.e. 375
            size = calculateSize(fontSize, .iPhone6)
            
        // For iPhone 6 Plus: i.e 414
        case let x where x < 415 :
            size = calculateSize(fontSize, .iPhonePlusSize)
            
        // For ipad Mini
        case let x where x < 769 :
            size = calculateSize(fontSize, .iPadMini)
            
        // For ipad 10 inch
        case let x where x < 835 :
            size = calculateSize(fontSize, .iPad_10inch)
            
        // For ipad 12 inch
        case let x where x < 1025 :
            size = calculateSize(fontSize, .iPad_12inch)
            
        default :
            size = calculateSize(fontSize, .iPadMini)
        }
        
        if AppFonts.isDynamicFontEnabled {
            guard let customFont = UIFont(name: name, size: size) else {
                return UIFont.systemFont(ofSize: size)
            }
            return UIFontMetrics.default.scaledFont(for: customFont)
        }
        else {
            return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
    
    
//    func withDefaultSize() -> UIFont {
//        return UIFont(name: name, size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
//    }
    
    
    private func calculateSize(_ fontSize:CGFloat, _ deviceType: DeviceType) -> CGFloat {
        
        switch deviceType {
        case .iPhone5:
            return fontSize * CGFloat(0.94)
        case .iPhone6:
            return fontSize
        case .iPhonePlusSize:
            return fontSize + CGFloat(2)
        case .iPadMini:
            return fontSize + fontSize * CGFloat(0.5)
        case .iPad_10inch:
            return fontSize + fontSize * CGFloat(0.6)
        case .iPad_12inch:
            return fontSize + fontSize
        }
    }
}

// USAGE : let font = AppFonts.Helvetica.withSize(13.0)
// USAGE : let font = AppFonts.Helvetica.withDefaultSize()
