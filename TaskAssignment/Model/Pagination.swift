//
//  Pagination.swift
//  TaskAssignment
//
//

import Foundation
struct Pagination : Codable {
    let limit : Int?
    let offset : Int?
    let count : Int?
    let total : Int?

    enum CodingKeys: String, CodingKey {

        case limit = "limit"
        case offset = "offset"
        case count = "count"
        case total = "total"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }

}
