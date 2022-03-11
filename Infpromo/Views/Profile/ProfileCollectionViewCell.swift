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
        label.attributedText = NSAttributedString(string: "Profil bilgilerimmmmmmm....", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureCell()
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
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
        layer.shadowRadius = 4.0

        // The color of the drop shadow
        layer.shadowColor = UIColor.lightGray.cgColor

        // How transparent the drop shadow is
        layer.shadowOpacity = 0.4

        // How far the shadow is offset from the UICollectionViewCell’s frame
        layer.shadowOffset = CGSize(width: 0, height: 3)
        
        
    }
}
