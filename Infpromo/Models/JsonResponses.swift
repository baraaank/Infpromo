//
//  JsonResponses.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.04.2022.
//

import Foundation

struct JsonResponses: Codable, Error {
    let success: Bool
    let message: String
    let code: Int
    let data: IsCreated?
}

struct IsCreated: Codable {
    
}


struct JsonResponsesInt: Codable, Error {
    let success: Int
    let message: String
    let code: Int
    let data: IsCreatedInt?
}

struct IsCreatedInt: Codable {
    
}
