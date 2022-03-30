//
//  GetUser.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 28.03.2022.
//

import Foundation

struct GetUser: Decodable {
    let data: GetUserDataResponse
}

struct GetUserDataResponse: Decodable {
    let userPublic: UserResponse
}

