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
    let code: Int?
    let message: String?
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
    
}


//struct ReportsLogResponse: Codable {
//    let id: String
//}
