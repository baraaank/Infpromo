//
//  NotableLikersCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.05.2022.
//

import UIKit

class NotableLikersCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "notableLikersCollectionViewCellIdentifier"
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "pp")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cemal Can Cansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "@cemalcancansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        
        return label
    }()
    
    let usernameButton: CustomFilterButton = {
        let button = CustomFilterButton(type: .system)
        button.setAttributedTitle(NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
//        button.backgroundColor = .clear
        return button
    }()
    
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "3,2M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçi", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfEngagementsAndRatesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "1,1M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let engagementsAndRatesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Etkileşim", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    let goToDetailButton: CustomFilterButton = {
        let button = CustomFilterButton(type: .system)
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
//        button.setAttributedTitle(NSAttributedString(string: "Detay -1", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        configureCell()
//        contentView.isHidden = true
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
//        addSubview(usernameLabel)
        contentView.addSubview(usernameButton)
        contentView.addSubview(numberOfFollowersLabel)
        contentView.addSubview(followersLabel)
        contentView.addSubview(numberOfEngagementsAndRatesLabel)
        contentView.addSubview(engagementsAndRatesLabel)
        contentView.addSubview(goToDetailButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 10, y: height / 2 - width / 10, width: width / 5, height: width / 5)
        imageView.layer.cornerRadius = width / 10
        
        let fiveOfOneHeight: CGFloat = height / 5.88
       
        numberOfEngagementsAndRatesLabel.frame = CGRect(x: imageView.right + 5, y: 10, width: width / 2.2, height: fiveOfOneHeight)
        engagementsAndRatesLabel.frame = CGRect(x: imageView.right + 5, y: numberOfEngagementsAndRatesLabel.bottom , width: width / 2.2, height: fiveOfOneHeight)
        
        
        numberOfFollowersLabel.frame = CGRect(x: numberOfEngagementsAndRatesLabel.right + 5, y: 10, width: width / 3.8, height: fiveOfOneHeight)
        followersLabel.frame = CGRect(x: numberOfFollowersLabel.left, y: numberOfFollowersLabel.bottom , width: width / 3.8, height: fiveOfOneHeight)
        
        nameLabel.frame = CGRect(x: numberOfEngagementsAndRatesLabel.left, y: engagementsAndRatesLabel.bottom + 15, width: width / 2.2, height: fiveOfOneHeight)

        usernameButton.frame = CGRect(x: nameLabel.left, y: nameLabel.bottom, width: width / 2.2, height: fiveOfOneHeight)
        
        goToDetailButton.frame = CGRect(x: nameLabel.right + 5, y: followersLabel.bottom + 15, width: width / 3.8, height: fiveOfOneHeight * 2)
        
    }
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
    }
    
    func configureButtonTitle(_ with: String, color: UIColor) {
        let imageAttachment = NSTextAttachment()
        let image = UIImage(systemName: "doc", withConfiguration: UIImage.SymbolConfiguration.init(font: .systemFont(ofSize: 12, weight: .semibold), scale: .medium))?.withTintColor(.white)
        imageAttachment.image = image
        let fullString = NSMutableAttributedString(string: "\(with) ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white])
        
        fullString.append(NSAttributedString(attachment: imageAttachment))
        
        if with == "Detay" {
            goToDetailButton.setAttributedTitle(NSAttributedString(string: with, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        } else {
            goToDetailButton.setAttributedTitle(fullString, for: .normal)

        }
        
        goToDetailButton.backgroundColor = color
    }
    
    
    
    func configureCellByFilter(with viewModel: SearchWithFilterCellViewModel) {
        if let username = viewModel.username {
            usernameButton.setAttributedTitle(NSAttributedString(string: "@\(username)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
            
        }
        
        if viewModel.username == "" {
            if let name = viewModel.fullname {
                usernameButton.setAttributedTitle(NSAttributedString(string: "\(name)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
            }
        }
        
        if let engagements = viewModel.engagements {
            
            let intEngagement = Int(engagements)
            
            
            numberOfEngagementsAndRatesLabel.text = "\(intEngagement.roundedWithAbbreviations)"
        }
       
        if let followers = viewModel.followers {
                
            let intFollowers = Int(followers)
            
            numberOfFollowersLabel.text = "\(intFollowers.roundedWithAbbreviations)"
        }
        
        if let image = viewModel.picture {
            if let imageURL = URL(string: image) {
                imageView.sd_setImage(with: imageURL, completed: nil)
            }
        }
        
        if let fullName = viewModel.fullname {
            nameLabel.text = fullName
        } else {
            nameLabel.text = viewModel.username
        }
    }
}
