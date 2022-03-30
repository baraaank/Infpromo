//
//  User.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.03.2022.
//

import Foundation


struct User: Decodable {
    let user: UserResponse
    let token: String
    let decode: DecodeResponse
}

struct DecodeResponse: Codable {
    let _id: String
}


struct UserResponse: Decodable {
    let credit: Int?
    let _id: String?
    let name: String?
    let surName: String?
    let email: String?
    let reportsLog: [ReportsLogResponse]
}

struct ReportsLogResponse: Decodable {
    let _id: String?
    let name: String?
    let userId: String?
//    let logDate: String?
//    let network: String?
    let data: ReportsLogDataResponse
}

struct ReportsLogDataResponse: Decodable {
    let profile: ProfResponse
}


struct ProfResponse: Decodable {
    let profile: ProfResResponse
}

struct ProfResResponse: Decodable {
    let fullname: String?
    let username: String?
    let url: String?
    let picture: String?
    //    let followers: UncertainValue<Int, String>?
    //    let engagementRate: UncertainValue<Int, String>?
    //    let engagements: UncertainValue<Int, String>?
    let followers: QuantumValue?
    let engagementRate: QuantumValue?
    let engagements: QuantumValue?
}



//struct ReportsLogResponse: Codable {
//    let id: String
//}
