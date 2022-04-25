//
//  ReportDetail.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import Foundation

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
