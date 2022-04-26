//
//  TagsViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import Foundation


struct HashtagsViewModel {
    let hashtag: String
   
    var clearHashtag: String {
        return "#\(hashtag)"
    }
    
   
}


struct MentionsViewModel {
    let mention: String
    var clearMention: String {
        return "@\(mention)"
    }
}
