//
//  UIDeviceExtension.swift
//
//  Created by Pramod Kumar on 15/11/17.
//  Copyright © 2017 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Photos

extension UIDevice {
    
    static var isSimulator:Bool {
        
        var isSimulator = false
        #if arch(i386) || arch(x86_64)
            //simulator
            isSimulator = true
        #endif
        return isSimulator
    }
    static let isIPhone = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    static let isIPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
