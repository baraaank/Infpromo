//
//  FirstDetailsCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class FirstDetailsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "firstDetailsCollectionReusableViewIdentifier"
    static let kind = "firstDetailsCollectionReusableViewKind"
    

    
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
//        label.backgroundColor = .black
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        return label
    }()
    

    
    let usernameButton: CustomFilterButton = {
        let button = CustomFilterButton()
        button.setAttributedTitle(NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let divideByTen = height / 18
        
        profileImageView.frame = CGRect(x: (width / 2) - (height / 4), y: divideByTen, width: height / 2, height: height / 2)
        profileImageView.layer.cornerRadius = profileImageView.width / 2
        nameLabel.frame = CGRect(x: 40, y: profileImageView.bottom + (2 * divideByTen), width: width - 80, height: divideByTen * 2)
        usernameButton.frame = CGRect(x: 40, y: nameLabel.bottom, width: width - 80, height: divideByTen * 2)
    }
    
    func configureProfile(with viewModel: ReportDetailViewModel) {
        if let image = viewModel.picture {
            if let imageURL = URL(string: image) {
                profileImageView.sd_setImage(with: imageURL, completed: nil)
            }
        }
        
        
        if let name = viewModel.fullName {
            nameLabel.text = name
        }
        
        if let username = viewModel.username {
            
            usernameButton.setAttributedTitle(NSAttributedString(string: "@\(username)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
        }
        
        
    }
}
