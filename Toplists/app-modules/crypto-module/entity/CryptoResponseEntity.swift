//
//  CryptoModel.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct CryptoResponseEntity: Codable {
    let message: String
    let type: Int
    let metaData: MetadataEntity
    let data: [CryptoDataEntity]
    
    enum CodingKeys: String, CodingKey {
        case message = "Message";
        case type = "Type";
        case metaData = "MetaData";
        case data = "Data"
    }
}
