//
//  CredibilityViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import Foundation

struct CredibilityViewModel {
    let credibility: Double
    
    var clearCredibility: Double {
        AbbreviationsHelper.clear(doubleOne: self.credibility)
    }
}
