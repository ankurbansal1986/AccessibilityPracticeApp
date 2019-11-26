//
//  CommonTableViewCell.swift
//  MVVMPracticeApplication
//
//  Created by Renu Devi on 21/11/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

struct AssetModel: Codable {
    
    struct Transaction: Codable {
        var title: String = ""
        var price: Double = 0.0
        
        enum CodingKeys : String,CodingKey {
            case title
            case price
        }
    }
    
    var checking: [Transaction] = []
    var investment: [Transaction] = []
    
    enum TopLevelCodingKeys: String, CodingKey {
        case data
    }
    enum AssetModelCodingKeys: String, CodingKey {
        case checking
        case investment
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
        let assetContainer = try container.nestedContainer(keyedBy: AssetModelCodingKeys.self, forKey: .data)
        checking = try assetContainer.decode([Transaction].self, forKey: .checking)
        investment = try assetContainer.decode([Transaction].self, forKey: .investment)
    }
}
