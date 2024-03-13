//
//  RawEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct RawEntity: Codable {
    let usd: CurrencyInfoEntity
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD";
    }
}
