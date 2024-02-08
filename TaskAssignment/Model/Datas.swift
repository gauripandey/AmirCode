//
//  Datas.swift
//  TaskAssignment
//
//

import Foundation
struct Datas : Codable {
    let open : Double?
    let high : Double?
    let low : Double?
    let close : Double?
    let volume : Double?
    let adj_high : Double?
    let adj_low : Double?
    let adj_close : Double?
    let adj_open : Double?
    let adj_volume : Double?
    let split_factor : Double?
    let dividend : Double?
    let symbol : String?
    let exchange : String?
    let date : String?

    enum CodingKeys: String, CodingKey {

        case open = "open"
        case high = "high"
        case low = "low"
        case close = "close"
        case volume = "volume"
        case adj_high = "adj_high"
        case adj_low = "adj_low"
        case adj_close = "adj_close"
        case adj_open = "adj_open"
        case adj_volume = "adj_volume"
        case split_factor = "split_factor"
        case dividend = "dividend"
        case symbol = "symbol"
        case exchange = "exchange"
        case date = "date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        open = try values.decodeIfPresent(Double.self, forKey: .open)
        high = try values.decodeIfPresent(Double.self, forKey: .high)
        low = try values.decodeIfPresent(Double.self, forKey: .low)
        close = try values.decodeIfPresent(Double.self, forKey: .close)
        volume = try values.decodeIfPresent(Double.self, forKey: .volume)
        adj_high = try values.decodeIfPresent(Double.self, forKey: .adj_high)
        adj_low = try values.decodeIfPresent(Double.self, forKey: .adj_low)
        adj_close = try values.decodeIfPresent(Double.self, forKey: .adj_close)
        adj_open = try values.decodeIfPresent(Double.self, forKey: .adj_open)
        adj_volume = try values.decodeIfPresent(Double.self, forKey: .adj_volume)
        split_factor = try values.decodeIfPresent(Double.self, forKey: .split_factor)
        dividend = try values.decodeIfPresent(Double.self, forKey: .dividend)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        exchange = try values.decodeIfPresent(String.self, forKey: .exchange)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }

}
