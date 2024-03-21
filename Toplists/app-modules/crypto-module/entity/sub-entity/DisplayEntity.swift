//
//  DisplayEntity.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct DisplayEntity: Codable {
    let usd: DisplayInfoEntity
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD";
    }
}
