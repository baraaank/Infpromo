//
//  HashtagsMentionsCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 25.04.2022.
//

import UIKit

class HashtagsMentionsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "hashtagsMentionsCollectionReusableViewIdentifier"
    static let kind = "hashtagsMentionsCollectionReusableViewKind"
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Mentions And Hashtags"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(label)
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
