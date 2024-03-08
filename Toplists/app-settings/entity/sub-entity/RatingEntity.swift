//
//  RatingEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct RatingEntity: Codable {
    let weiss: WeissEntity
    
    enum CodingKeys: String, CodingKey {
        case weiss = "Weiss";
    }
}
