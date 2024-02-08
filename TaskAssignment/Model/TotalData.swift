//
//  TotalData.swift
//  TaskAssignment
//
//

import Foundation

struct TotalData : Codable {
    let pagination : Pagination?
    let data : [Datas]?

    enum CodingKeys: String, CodingKey {

        case pagination = "pagination"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
        data = try values.decodeIfPresent([Datas].self, forKey: .data)
    }

}
