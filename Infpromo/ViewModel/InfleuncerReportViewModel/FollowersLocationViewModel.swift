//
//  FollowersLocationViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import Foundation

struct FollowersLocationViewModel {
    let code: String
    let weight: Double
    
    var clearWeight: Double {
        AbbreviationsHelper.clear(doubleOne: self.weight)
    }
}


struct FollowersGeoCities {
    let name: String
}
