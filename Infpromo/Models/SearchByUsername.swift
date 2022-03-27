//
//  SearchByUsername.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.03.2022.
//

import Foundation

struct SearchByUsername: Codable {
    let data: DataResponse
}

struct DataResponse: Codable {
    let bodyNew: BodyNewResponse
}

struct BodyNewResponse: Codable {
    let directs: [DirectsResponse]
}

struct DirectsResponse: Codable {
    let userId: String
    let profile: DirectProfileResponse
}

struct DirectProfileResponse: Codable {
    let engagementRate: Double?
    let engagements: Int?
    let followers: Int?
    let fullName: String?
    let picture: String?
    let url: String?
    let username: String?
    let isPrivate: Bool?
}
