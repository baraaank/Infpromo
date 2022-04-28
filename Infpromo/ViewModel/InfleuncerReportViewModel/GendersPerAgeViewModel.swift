//
//  GendersPerAge.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.04.2022.
//

import Foundation

struct GendersPerAgeViewModel {
    let code: String
    let male: Double
    let female: Double
    
    var clearMale: Double {
        AbbreviationsHelper.clear(doubleOne: self.male)
    }
    
    var clearFemale: Double {
        AbbreviationsHelper.clear(doubleOne: self.female)
    }
}
