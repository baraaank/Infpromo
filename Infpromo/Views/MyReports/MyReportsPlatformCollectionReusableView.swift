//
//  MyReportsPlatformCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 28.03.2022.
//

import UIKit

class MyReportsPlatformCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "myReportsPlatformCollectionReusableViewIdentifier"
    static let kind = "myReportsPlatformCollectionReusableViewKind"
    
//    private let dateLabel: UILabel = {
//       let label = UILabel()
//        label.attributedText = NSAttributedString(string: "Platform: instagram", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
//        label.backgroundColor = .systemGray3
//        return label
//    }()
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor().infpromo
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageView.frame = bounds
    }
}
