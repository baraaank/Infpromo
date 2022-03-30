//
//  MyReportsDateCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 28.03.2022.
//

import UIKit

class MyReportsDateCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "myReportsDateCollectionReusableViewIdentifier"
    static let kind = "myReportsDateCollectionReusableViewKind"
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Alındığı tarih: Paz, 12 Eyl 2021 21:20", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dateLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        dateLabel.frame = bounds
    }
    
    
}
