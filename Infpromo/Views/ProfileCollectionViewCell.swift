//
//  ProfileCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.02.2022.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "profileCollectionViewCellIdentifier"
    
    let label: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Profil bilgilerimmmmmmm....", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)])
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    func addSubviews() {
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 20, y: 10, width: width - 20, height: height - 20)
    }
}
