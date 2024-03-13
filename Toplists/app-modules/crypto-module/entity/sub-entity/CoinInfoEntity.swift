//
//  CoinInfoEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct CoinInfoEntity: Codable {
    let id: String
    let name: String
    let fullName: String
    let `internal`: String
    let imageUrl: String
    let url: String
    let algorithm: String
    let proofType: String
    let rating: RatingEntity
    let blockNumber: Int
    let blockTime: Double
    let blockReward: Double
    let assetLaunchDate: String
    let maxSupply: Double
    let type: Int
    let documentType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id";
        case name = "Name";
        case fullName = "FullName";
        case `internal` = "Internal";
        case imageUrl = "ImageUrl";
        case url = "Url";
        case algorithm = "Algorithm";
        case proofType = "ProofType";
        case rating = "Rating";
        case blockNumber = "BlockNumber";
        case blockTime = "BlockTime";
        case blockReward = "BlockReward";
        case assetLaunchDate = "AssetLaunchDate";
        case maxSupply = "MaxSupply";
        case type = "Type";
        case documentType = "DocumentType";
    }
}
