//
//  AbbreviationsHelper.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import Foundation

struct AbbreviationsHelper {
    static func clear(doubleOne: Double) -> Double {
        let clear = Double(doubleOne * 100)
        let clearOne = clear.truncate(places: 2)
        return clearOne
    }
    
    static func addingLetter(intOne: Double) -> String {
        let intAbb = Int(intOne)
        return intAbb.roundedWithAbbreviations
    }
}
