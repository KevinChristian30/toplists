//
//  NewsEntity.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct NewsResponseEntity: Codable {
    let message: String
    let type: Int
    let data: [NewsDataEntity]
    
    enum CodingKeys: String, CodingKey {
        case message = "Message";
        case type = "Type";
        case data = "Data"
    }
}
