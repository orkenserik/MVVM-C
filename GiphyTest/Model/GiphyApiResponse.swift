//
//  GiphyApiResponse.swift
//  GiphyTest
//
//  Created by Orken Serik on 03.08.2021.
//

import Foundation

struct GiphyApiResponse: Codable {
    let data: [Giphy]
    let pagination: Pagination
    let meta: Meta
}


struct Meta: Codable {
    let status: Int
    let msg, responseID: String

    enum CodingKeys: String, CodingKey {
        case status, msg
        case responseID = "response_id"
    }
}


struct Pagination: Codable {
    let totalCount, count, offset: Int

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case count, offset
    }
}
