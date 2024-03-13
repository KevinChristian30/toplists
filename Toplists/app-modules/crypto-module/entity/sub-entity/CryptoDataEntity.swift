//
//  CryptoDataEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct CryptoDataEntity: Codable {
    let coinInfo: CoinInfoEntity
    let raw: RawEntity
    
    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo";
        case raw = "RAW";
    }
}
