//
//  YoutubePopularPostsViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 11.05.2022.
//

import Foundation

struct YoutubePopularPostsViewModel {
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
    let views: Int
    let thumbnail: String
    let video: String
    
}
