//
//  YoutubePopularPostsCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 11.05.2022.
//

import UIKit

class YoutubePopularPostsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "youtubePopularPostsCollectionReusableViewIdentifier"
    static let kind = "youtubePopularPostsCollectionReusableViewKind"
    
    
    let label: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: " Popular Postlar", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        addSubview(label)
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
