//
//  PopularPostViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import Foundation

struct PopularPostViewModel {
    let url: String
    let created: String
    let likes: Int
    var clearLikes: String {
        return AbbreviationsHelper.addingLetter(intOne: Double(self.likes))
    }
    let comments: Int
    var clearComments: String {
        return AbbreviationsHelper.addingLetter(intOne: Double(self.comments))
    }
    let image: String
}



