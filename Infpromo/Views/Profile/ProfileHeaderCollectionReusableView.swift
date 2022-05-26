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
        let image = UIImage(systemName: "person")
        let imageView = UIImageView(image: image)
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor().infpromo.cgColor
        imageView.tintColor = UIColor().infpromo
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "-", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .left
        return label
    }()
    
    private let titleImageView: UIImageView = {
        let image = UIImage(systemName: "tshirt", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor().infpromo
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let socialMediaImageView: UIImageView = {
        let image = UIImage(systemName: "person.wave.2", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor().infpromo
        
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "henüz girilmemiş..", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        label.textAlignment = .left
        return label
    }()
    
    private let socialMediaLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "henüz girilmemiş..", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        label.textAlignment = .left
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
//        addSubview(profilePicture)
        addSubview(nameLabel)
        addSubview(profilePicture)
        addSubview(titleImageView)
        addSubview(socialMediaImageView)
        addSubview(titleLabel)
        addSubview(socialMediaLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        profilePicture.frame = CGRect(x: 20, y: height / 2 - 60, width: 120, height: 120)
//        profilePicture.layer.cornerRadius = profilePicture.width / 2
//        nameLabel.frame = CGRect(x: 140 + 20, y: height / 2 - 20, width: width - profilePicture.width, height: 40)
//        profilePicture.frame = CGRect(x: (width / 2) - 50, y: (height / 2) - 50, width: 100, height: 100)
//        profilePicture.layer.cornerRadius = profilePicture.width / 2
//        nameLabel.frame = CGRect(x: 60, y: profilePicture.bottom + 30, width: width - 120, height: 40)
//        nameLabel.frame = CGRect(x: 20, y: 0, width: width, height: height)
        
        
        profilePicture.frame = CGRect(x: 40, y: 40, width: height / 2, height: height / 2)
        profilePicture.layer.cornerRadius = profilePicture.width / 2
        let profilePictureHeight = profilePicture.height
        let oneOfSixHeight = profilePictureHeight / 12
        nameLabel.frame = CGRect(x: profilePicture.right + 20 , y: profilePicture.top + 20, width: width - profilePicture.width - 40, height: oneOfSixHeight * 3)
        socialMediaImageView.frame = CGRect(x: nameLabel.left, y: nameLabel.bottom + oneOfSixHeight / 2, width: 20, height: 20)
        socialMediaLabel.frame = CGRect(x: socialMediaImageView.right + 10, y: nameLabel.bottom + oneOfSixHeight / 2, width: width / 2, height: oneOfSixHeight * 2)
        titleImageView.frame = CGRect(x: nameLabel.left, y: socialMediaImageView.bottom + oneOfSixHeight / 2, width: 20, height: 20)
        titleLabel.frame = CGRect(x: titleImageView.right + 10, y: socialMediaImageView.bottom + oneOfSixHeight / 2, width: width / 2, height: oneOfSixHeight*2)
        
        
    }
    
    func configureHeader(with viewModel: ProfileHeaderReusableViewModel) {
        if let name = viewModel.name {
            if let surname = viewModel.surName {
                nameLabel.text = "\(name) \(surname)"
            }
        }
        
       

        if let socialMedia = viewModel.socialMedia {
            socialMediaLabel.text = socialMedia
            socialMediaLabel.textColor = .black
        }
        
        if viewModel.socialMedia == "" {
            socialMediaLabel.text = "henüz girilmemiş.."
            socialMediaLabel.textColor = .lightGray
        }

        if let title = viewModel.title {
            titleLabel.text = title
            titleLabel.textColor = .black
        }
        
        if viewModel.title == "" {
            titleLabel.text = "henüz girilmemiş.."
            titleLabel.textColor = .lightGray
        }
        

        
        
     
        
    }
    
}
