//
//  MetadataEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct MetadataEntity: Codable {
    let count: Int;
    
    enum CodingKeys: String, CodingKey {
        case count = "Count";
    }
}
