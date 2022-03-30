//
//  ProfileHeaderCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.02.2022.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
   
    static let reuseIdentifier = "profileHeaderCollectionReusableViewIdentifier"
    static let kind = "profileHeaderCollectionReusableViewKind"
    
    private let profilePicture: UIImageView = {
       let image = UIImage(named: "pp")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cemal Can Cansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(profilePicture)
        addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profilePicture.frame = CGRect(x: 20, y: height / 2 - 60, width: 120, height: 120)
        profilePicture.layer.cornerRadius = profilePicture.width / 2
        nameLabel.frame = CGRect(x: 140 + 20, y: height / 2 - 20, width: width - profilePicture.width, height: 40)
    }
    
    func configureHeader(with viewModel: ProfileHeaderReusableViewModel) {
        if let name = viewModel.name {
            if let surname = viewModel.surName {
                nameLabel.text = "\(name) \(surname)"
            }
        }
    }
    
}
