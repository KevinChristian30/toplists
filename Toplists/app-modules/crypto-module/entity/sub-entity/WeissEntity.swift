//
//  WeissEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct WeissEntity: Codable {
    let rating: String
    let technologyAdoptionRating: String
    let marketPerformanceRating: String
    
    enum CodingKeys: String, CodingKey {
        case rating = "Rating";
        case technologyAdoptionRating = "TechnologyAdoptionRating";
        case marketPerformanceRating = "MarketPerformanceRating";
    }
}
