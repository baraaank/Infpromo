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
        label.text = "Popular Posts"
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
