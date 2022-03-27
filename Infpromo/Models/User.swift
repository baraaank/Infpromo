//
//  User.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.03.2022.
//

import Foundation


struct User: Codable {
    let user: UserResponse
    let token: String
    let decode: DecodeResponse
}

struct UserResponse: Codable {
    let email: String
    let credit: Int
//    let reportsLog: ReportsLogResponse
}

struct DecodeResponse: Codable {
    let _id: String
}

//struct ReportsLogResponse: Codable {
//    let id: String
//}
