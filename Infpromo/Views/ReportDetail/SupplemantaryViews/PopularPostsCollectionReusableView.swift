//
//  PopularPostsCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class PopularPostsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "popularPostsCollectionReusableViewIdentifier"
    static let kind = "popularPostsCollectionReusableViewKind"
    
    
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
