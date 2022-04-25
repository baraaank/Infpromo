//
//  HashtagsMentionsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 25.04.2022.
//

import UIKit

class HashtagsMentionsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "hashtagsMentionsCollectionViewCellIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
