//
//  PastReportCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 21.02.2022.
//

import UIKit
import SDWebImage
import SkeletonView

class PastReportCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "pastReportCollectionViewCellIdentifier"
    
//    private let dateLabel: UILabel = {
//       let label = UILabel()
//        label.backgroundColor = .red
//        return label
//    }()
//
//    private let platformLabel: UILabel = {
//        let label = UILabel()
//         label.backgroundColor = .blue
//         return label
//    }()
//    
    
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
        label.attributedText = NSAttributedString(string: "1,1M (7.34 %)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let engagementsAndRatesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Etkileşimler ve Oranı", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    let goToDetailButton: CustomFilterButton = {
        let button = CustomFilterButton(type: .system)
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        button.setAttributedTitle(NSAttributedString(string: "Detay -1", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        configureCell()
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameButton)
        contentView.addSubview(numberOfFollowersLabel)
        contentView.addSubview(followersLabel)
        contentView.addSubview(numberOfEngagementsAndRatesLabel)
        contentView.addSubview(engagementsAndRatesLabel)
        contentView.addSubview(goToDetailButton)
//        addSubview(dateLabel)
//        addSubview(platformLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fiveOfOneHeight: CGFloat = height / 5.88
        
        
        imageView.frame = CGRect(x: 10, y: height / 2 - width / 10, width: width / 5, height: width / 5)
        imageView.layer.cornerRadius = width / 10

        
       
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
        
//        layer.shadowRadius = 4.0
//
//        layer.shadowColor = UIColor.lightGray.cgColor
//
//        layer.shadowOpacity = 0.4
//
//        layer.shadowOffset = CGSize(width: 0, height: 3)
        
        
    }
    func configureCellData(with viewModel: MyReportsCollectionViewCellViewModel) {
        if let username = viewModel.username {
            usernameButton.setAttributedTitle(NSAttributedString(string: "@\(username)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
            
        }
        
        if let engagements = viewModel.engagements, let engagementsRate = viewModel.engagementRate {
            
            
//            if let engagements = viewModel.engagements, let engagementsRate = viewModel.engagementRate {
//
//                let intEngagement = Int(engagements)
//
//                let clearEngagementRate = Double(engagementsRate * 100)
//                let clearEngagement = clearEngagementRate.truncate(places: 2)
//                numberOfEngagementsAndRatesLabel.text = "\(intEngagement.roundedWithAbbreviations) & (\(clearEngagement)%)"
//            }
            
            let intQuantumEngagement = Int(engagements.floatValue ?? 10)
            
            let quantumRate = engagementsRate.floatValue ?? 10
            let clearEngagementRate = Double(quantumRate * 100)
            
            let clearEngagement = clearEngagementRate.truncate(places: 2)
            numberOfEngagementsAndRatesLabel.text = "\(intQuantumEngagement.roundedWithAbbreviations) (\(clearEngagement)%)"
        }
       
        if let followers = viewModel.followers {
            let intQuantumFollowers = Int(followers.floatValue ?? 10)
            numberOfFollowersLabel.text = "\(intQuantumFollowers.roundedWithAbbreviations)"
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

