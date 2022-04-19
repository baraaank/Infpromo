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
        label.attributedText = NSAttributedString(string: "Profil bilgilerimmmmmmm....", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .left
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImage(systemName: "chevron.forward", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
//        imageView.frame = CGRect(x: 340, y: 12, width: 22, height: 22)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureCell()
    }
    
    func addSubviews() {
        addSubview(label)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 20, y: 10, width: width - 20, height: height - 20)
        imageView.frame = CGRect(x: width - 24, y: (height / 2) - 5, width: 10, height: 10)
    }
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
//        layer.shadowRadius = 4.0
//
//        // The color of the drop shadow
//        layer.shadowColor = UIColor.lightGray.cgColor
//
//        // How transparent the drop shadow is
//        layer.shadowOpacity = 0.4
//
//        // How far the shadow is offset from the UICollectionViewCell’s frame
//        layer.shadowOffset = CGSize(width: 0, height: 3)
//        
//        
    }
}
