//
//  ReportDetail.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import Foundation
import UIKit

struct ReportDetail: Codable {
    let data: PDFBody
}

struct PDFBody: Codable {
    let pdfBody: PDFBodyResponse
}

struct PDFBodyResponse: Codable {
    let data: PDFData
}

struct PDFData: Codable {
    let profile: PDFProfile
}



struct PDFProfile: Codable {
    let profile: PDFInfluencerProfile
    let stats: StatsResponse
    let avgLikes: Int
    let avgComments: Int
    let popularPosts: [PopularPostResponse]
    let statHistory: [StatHistoryResponse] // data for charts
    let hashtags: [HashtagsResponse]
    let mentions: [MentionsResponse]
    let audience: AudienceResponse //followers datas
}


struct PDFInfluencerProfile: Codable {
    let fullname: String?
    let username: String
    let picture: String
    let followers: Int
    let engagementRate: Double
    let engagements: Int
    
}

struct StatsResponse: Codable {
    let avgLikes: AvgLikesResponse
    let followers: FollowersResponse
}

struct AvgLikesResponse: Codable {
    let value: Int
    let compared: Double
}

struct FollowersResponse: Codable {
    let value: Int
    let compared: Double
}


struct PopularPostResponse: Codable {
    let url: String
    let created: String
    let likes: Int
    let comments: Int
    let image: String
}

struct StatHistoryResponse: Codable {
    let month: String
    let followers: Int
    let avgLikes: Int
    let following: Int
}


struct HashtagsResponse: Codable {
    let tag: String
    let weight: Double
}

struct MentionsResponse: Codable {
    let tag: String
    let weight: Double
}

struct AudienceResponse: Codable {
    
    let credibility: Double
    let genders: [GendersResponse]
    let geoCities: [GeoCitiesResponse]
    let geoCountries: [GeoCountriesResponse]
}


struct GendersResponse: Codable {
    let code: String
    let weight: Double
}

struct GeoCitiesResponse: Codable {
    let name: String
    let weight: Double
}

struct GeoCountriesResponse: Codable {
    let name: String
    let weight: Double
}
