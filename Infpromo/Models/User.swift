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
}

struct UserResponse: Codable {
    let email: String
    let credit: Int
//    let reportsLog: ReportsLogResponse
}

//struct ReportsLogResponse: Codable {
//    let id: String
//}
