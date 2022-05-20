//
//  JsonResponses.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.04.2022.
//

import Foundation

struct JsonResponses: Decodable, Error {
    let success: Bool
    let message: String
    let code: Int
    let data: IsCreated?
}

struct IsCreated: Decodable {
    let userPublic: UserResponse?
}


