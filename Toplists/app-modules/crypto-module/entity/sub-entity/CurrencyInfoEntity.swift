//
//  CurrencyInfoEntity.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

struct CurrencyInfoEntity: Codable {
    let type: String
    let market: String
    let fromSymbol: String
    let flags: String
    let lastMarket: String
    let median: Double
    let topTierVolume24Hour: Double
    let topTierVolume24HourTo: Double
    let lastTradeId: String
    let price: Double
    let lastUpdate: Int64
    let lastVolume: Double
    let lastVolumeTo: Double
    let volumeHour: Double
    let volumeHourTo: Double
    let openHour: Double
    let highHour: Double
    let lowHour: Double
    let volumeDay: Double
    let volumeDayTo: Double
    let openDay: Double
    let highDay: Double
    let lowDay: Double
    let volume24Hour: Double
    let volume24HourTo: Double
    let open24Hour: Double
    let high24Hour: Double
    let low24Hour: Double
    let change24Hour: Double
    let changePCT24Hour: Double
    let changeDay: Double
    let changePCTDay: Double
    let changeHour: Double
    let changePCTHour: Double
    let conversionType: String
    let conversionSymbol: String
    let conversionLastUpdate: Int64
    let supply: Double
    let marketCap: Double
    let marketCapPenalty: Double
    let circulatingSupply: Double
    let circulatingSupplyMarketCap: Double
    let totalVolume24Hour: Double
    let totalVolume24HourTo: Double
    let totalTopTierVolume24H: Double
    let totalTopTierVolume24HTo: Double
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case type = "TYPE";
        case market = "MARKET";
        case fromSymbol = "FROMSYMBOL";
        case flags = "FLAGS";
        case lastMarket = "LASTMARKET";
        case median = "MEDIAN";
        case topTierVolume24Hour = "TOPTIERVOLUME24HOUR";
        case topTierVolume24HourTo = "TOPTIERVOLUME24HOURTO";
        case lastTradeId = "LASTTRADEID";
        case price = "PRICE";
        case lastUpdate = "LASTUPDATE";
        case lastVolume = "LASTVOLUME";
        case lastVolumeTo = "LASTVOLUMETO";
        case volumeHour = "VOLUMEHOUR";
        case volumeHourTo = "VOLUMEHOURTO";
        case openHour = "OPENHOUR";
        case highHour = "HIGHHOUR";
        case lowHour = "LOWHOUR";
        case volumeDay = "VOLUMEDAY";
        case volumeDayTo = "VOLUMEDAYTO";
        case openDay = "OPENDAY";
        case highDay = "HIGHDAY";
        case lowDay = "LOWDAY";
        case volume24Hour = "VOLUME24HOUR";
        case volume24HourTo = "VOLUME24HOURTO";
        case open24Hour = "OPEN24HOUR";
        case high24Hour = "HIGH24HOUR";
        case low24Hour = "LOW24HOUR";
        case change24Hour = "CHANGE24HOUR";
        case changePCT24Hour = "CHANGEPCT24HOUR";
        case changeDay = "CHANGEDAY";
        case changePCTDay = "CHANGEPCTDAY";
        case changeHour = "CHANGEHOUR";
        case changePCTHour = "CHANGEPCTHOUR";
        case conversionType = "CONVERSIONTYPE";
        case conversionSymbol = "CONVERSIONSYMBOL";
        case conversionLastUpdate = "CONVERSIONLASTUPDATE";
        case supply = "SUPPLY";
        case marketCap = "MKTCAP";
        case marketCapPenalty = "MKTCAPPENALTY";
        case circulatingSupply = "CIRCULATINGSUPPLY";
        case circulatingSupplyMarketCap = "CIRCULATINGSUPPLYMKTCAP";
        case totalVolume24Hour = "TOTALVOLUME24H";
        case totalVolume24HourTo = "TOTALVOLUME24HTO";
        case totalTopTierVolume24H = "TOTALTOPTIERVOLUME24H";
        case totalTopTierVolume24HTo = "TOTALTOPTIERVOLUME24HTO";
        case imageURL = "IMAGEURL";
    }
}
