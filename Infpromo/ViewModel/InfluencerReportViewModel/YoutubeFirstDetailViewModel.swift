//
//  YoutubeFirstDetailViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 11.05.2022.
//

import Foundation

struct YoutubeFirstDetailViewModel {
    let followers: Double
    let engagementRate: Double
    let engagements: Double
    let views: Double
    let comments: Double
    
    var clearEngagement: Double {
        return AbbreviationsHelper.clear(doubleOne: self.engagementRate)
    }
    
    
    
    var clearViews: Double {
        return AbbreviationsHelper.clear(doubleOne: self.views)
    }
    
    var clearFollowersCompared: Double {
        return AbbreviationsHelper.clear(doubleOne: self.followers)
    }
    
    var clearComment: Double {
        return AbbreviationsHelper.clear(doubleOne: self.comments)
    }
}
