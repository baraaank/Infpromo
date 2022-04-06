//
//  Plan.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 6.04.2022.
//

import Foundation

struct Plan: Codable {
    let data: [PlanResponse]
}

struct PlanResponse: Codable {
    let name: String
    let oldPrice: String?
    let newPrice: String
    let credit: Int
    let profit: String?
}
