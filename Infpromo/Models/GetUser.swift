//
//  GetUser.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.04.2022.
//

import Foundation

struct GetUser: Decodable {
    let data: GetUserData
}

struct GetUserData: Decodable {
    let userPublic: UserResponse //in user
}
