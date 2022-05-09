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
    let stats: StatsResponse?
    let avgLikes: Int?
    let avgComments: Int?
    let popularPosts: [PopularPostResponse]
    let recentPosts: [RecentPostsResponse]
    let statHistory: [StatHistoryResponse] // data for charts
    let hashtags: [HashtagsResponse]
    let mentions: [MentionsResponse]
    let audience: AudienceResponse //followers datas
    let audienceLikers: AudienceLikersResponse
}


struct PDFInfluencerProfile: Codable {
    let fullname: String?
    let username: String?
    let picture: String
    let followers: Int
    let engagementRate: Double
    let engagements: Int
    let avarageViews: Int?
    let url: String?
    
}

struct RecentPostsResponse: Codable {
    let likes: Int
    let comments: Int
    let created: String
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
    let image: String?
    let video: String?
}

struct StatHistoryResponse: Codable {
    let month: String
    let followers: Int?
    let avgLikes: Int
    let following: Int?
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
    let gendersPerAge: [GendersPerAgeResponse]
    let notableUsers: [NotableUsersResponse]?
}

struct NotableUsersResponse: Codable {
    let engagements: Float?
    let followers: Float?
    let fullname: String?
    let picture: String?
    let url: String?
    let username: String?
    let userId: String?
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

struct GendersPerAgeResponse: Codable {
    let code: String
    let male: Double
    let female: Double
}


struct AudienceLikersResponse: Codable {
    let credibility: Double?
    let nonFollowerLikes: Double?
    let genders: [LikersGendersResponse]?
    let geoCities: [LikersGeoCitiesResponse]?
    let geoCountries: [LikersGeoCountriesResponse]?
    let gendersPerAge: [LikersGendersPerAgeResponse]?
    let notableUsers: [AudienceNotableUsersResponse]?
}

struct AudienceNotableUsersResponse: Codable {
    let engagements: Float?
    let followers: Float?
    let fullname: String?
    let picture: String?
    let url: String?
    let username: String?
    let userId: String?
}


struct LikersGendersResponse: Codable {
    let code: String
    let weight: Double
}

struct LikersGeoCitiesResponse: Codable {
    let name: String
    let weight: Double
}

struct LikersGeoCountriesResponse: Codable {
    let name: String
    let weight: Double
}

struct LikersGendersPerAgeResponse: Codable {
    let code: String
    let male: Double
    let female: Double
}
