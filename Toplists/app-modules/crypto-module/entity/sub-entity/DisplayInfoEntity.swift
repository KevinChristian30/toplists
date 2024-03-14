//
//  DisplayInfoEntity.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct DisplayInfoEntity: Codable {
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case price = "PRICE";
    }
}

