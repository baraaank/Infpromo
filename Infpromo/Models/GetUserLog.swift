//
//  GetUserLog.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.04.2022.
//

import Foundation

struct GetUserLog: Decodable {
    let data: getUserDataResponse
}

struct getUserDataResponse: Decodable {
    let reports: [getUserReportsResponse]
}

struct getUserReportsResponse: Decodable {
    let viewCount: Int
    let network: String
    let userCreatedDate: String
    let data: getUserReportsDataResponse
}

struct getUserReportsDataResponse: Decodable {
    let userId: String
    let profile: ProfileDataResponse
}

struct ProfileDataResponse: Decodable {
    let fullname: String?
    let username: String?
    let url: String?
    let picture: String?
    let followers: QuantumValue?
    let engagementRate: QuantumValue?
    let engagements: QuantumValue?
}


