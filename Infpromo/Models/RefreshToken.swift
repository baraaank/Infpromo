//
//  RefreshToken.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 25.05.2022.
//

import Foundation

struct RefreshToken: Codable {
    let token: String
    let decode: DecodeResponse
}
