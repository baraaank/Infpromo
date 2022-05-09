//
//  FirstDetailViewModel.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import Foundation

struct FirstDetailViewModel {
    let followers: Int
    let engagementRate: Double
    
    var clearEngagement: Double {
        return AbbreviationsHelper.clear(doubleOne: self.engagementRate)
    }
 
    let engagements: Int
    let likeValue: Int?
    let likeCompared: Double
    
    var clearLikeCompared: Double {
        return AbbreviationsHelper.clear(doubleOne: self.likeCompared)
    }
    
    let followersValue: Int?
    let followersCompared: Double
    
    var clearFollowersCompared: Double {
        return AbbreviationsHelper.clear(doubleOne: self.followersCompared)
    }
    

}




struct SFImagesForReport {
    let name: String
    let image: String
    let explanation: String
}
