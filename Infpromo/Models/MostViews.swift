//
//  MostViews.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.03.2022.
//

import Foundation

struct MostViews: Codable {
    let data: Reports
}

struct Reports: Codable {
    let reports: [ReportsData]
}

struct ReportsData: Codable {
    let viewCount: Int
    let _id: String
    let userId: String
    let network: String
    let data: ProfileData
}

struct ProfileData: Codable {
    let profile: MostViewedProfile
}

struct MostViewedProfile: Codable {
    let userId: String
    let profile: MostViewedProfileData
}

struct MostViewedProfileData: Codable {
    let fullname: String?
    let username: String?
    let url: String?
    let picture: String?
    let followers: Int?
    let engagementRate: Float?
    let engagements: Int?
}
