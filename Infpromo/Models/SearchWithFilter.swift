//
//  SearchWithFilter.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 3.04.2022.
//

import Foundation

struct SearchWithFilter: Codable {
    let data: DataFilterResponse
}

struct DataFilterResponse: Codable {
    let bodyNew: BodyNewFilterResponse
    let network: String
}

struct BodyNewFilterResponse: Codable {
    let total: Int
    let lookalikes: [LookalikesFilterResponse]
}

struct LookalikesFilterResponse: Codable {
    let userId: String
    let profile: ProfileFilterResponse
}

struct ProfileFilterResponse: Codable {
    let engagementRate: Float?
    let engagements: Float?
    let followers: Float?
    let fullname: String?
    let picture: String?
    let url: String?
    let username: String?
    let isPrivate: Bool?
}
