//
//  ChartsAvgLikesCommentsViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.05.2022.
//

import Foundation

struct ChartsAvgLikesCommentsViewModel {
    let likes: Int
    let comments: Int
    var created: String
    
    mutating func dateReturn() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMM yyyy"
        
        guard let date: Date = dateFormatterGet.date(from: created) else {
            return ""
        }
        
        created = dateFormatterPrint.string(from: date)
        return created
    }
    
   
}
