//
//  DisplayEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct DisplayEntity: Codable {
    let usd: CurrencyDisplayEntity
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD";
    }
}
