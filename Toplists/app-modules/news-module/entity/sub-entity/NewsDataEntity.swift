//
//  NewsDataEntity.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct NewsDataEntity: Codable {
    let id: String
    let title: String
    let body: String
    let source: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id";
        case title = "title";
        case body = "body";
        case source = "source"
    }
}
