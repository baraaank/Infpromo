//
//  MostVisitedReportsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 20.02.2022.
//

import UIKit
import SDWebImage
import SkeletonView


class MostVisitedReportsCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "mostVisitedReportsCollectionViewCellIdentifier"
    
    private let numberOfViewsLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "1234 kez görüntülendi.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .right
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "pp")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }()
    
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.attributedText = NSAttributedString(string: "Cemal Can", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
//        label.textAlignment = .center
//
//        return label
//    }()
    
    let nameButton: CustomFilterButton = {
        let button = CustomFilterButton(type: .system)
        
        button.setAttributedTitle(NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
        
        return button
    }()
    
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "3.2M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfEngagementRateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "4.62 %", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.textAlignment = .center
        
        return label
    }()
    
    let goToDetailButton: CustomFilterButton = {
        let button = CustomFilterButton(type: .system)
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
       
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureCell()
        
        
//        isSkeletonable = true
//        contentView.isSkeletonable = true
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(numberOfViewsLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(nameButton)
//        contentView.addSubview(nameLabel)
        contentView.addSubview(numberOfFollowersLabel)
        contentView.addSubview(numberOfEngagementRateLabel)
        contentView.addSubview(goToDetailButton)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fiveOfOneHeight = height / 11
        numberOfViewsLabel.frame = CGRect(x: 10, y: 5, width: width - 20, height: fiveOfOneHeight)
        imageView.frame = CGRect(x: width / 4, y: numberOfViewsLabel.bottom + 5, width: width / 2, height: width / 2)
        imageView.layer.cornerRadius = width / 4
//        nameLabel.frame = CGRect(x: 10, y: imageView.bottom + 5, width: width - 20, height: fiveOfOneHeight)
        nameButton.frame = CGRect(x: 10, y: imageView.bottom + 5, width: width - 20, height: fiveOfOneHeight)
//        numberOfFollowersLabel.frame = CGRect(x: width / 6, y: nameLabel.bottom + 5, width: width / 1.5, height: fiveOfOneHeight)
        numberOfFollowersLabel.frame = CGRect(x: width / 6, y: nameButton.bottom + 5, width: width / 1.5, height: fiveOfOneHeight)
        numberOfEngagementRateLabel.frame = CGRect(x: width / 6, y: numberOfFollowersLabel.bottom + 5, width: width / 1.5, height: fiveOfOneHeight)
        goToDetailButton.frame = CGRect(x: width / 6, y: numberOfEngagementRateLabel.bottom + 5, width: width / 1.5, height: fiveOfOneHeight * 1.5)
        
    }
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
//        
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
        
        
    }
    
    func configureCellData(with viewModel: MostViewedProfileDataCellViewModel) {
        if let fullname = viewModel.fullname {
            nameButton.setAttributedTitle(NSAttributedString(string: fullname, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo]), for: .normal)
        }
            
        if let followers = viewModel.followers {
            let intFollowers = followers
            numberOfFollowersLabel.text = "\(intFollowers.roundedWithAbbreviations)"
        }
        
        if let engagement = viewModel.engagementRate {
            let clearEngagementRate = Double(engagement * 100)
            let clearEngagement = clearEngagementRate.truncate(places: 2)
            
            numberOfEngagementRateLabel.text = "\(clearEngagement)%"
        }
        
       
        
//        let formattedFollowers = followers.formattedWithSeparator
//        let clearFollowers = formattedFollowers.prefix(4)
//        numberOfFollowersLabel.text = "\(clearFollowers) M"
     
        if let image = viewModel.picture {
            if let imageUrl = URL(string: image) {
                imageView.sd_setImage(with: imageUrl, completed: nil)
            }
        }
        
    
//        let imageData = try? Data(contentsOf: imageURL)
//        imageView.image = UIImage(data: imageData ?? Data("pp".utf8))
        
        if let viewCount = viewModel.viewCount {
            numberOfViewsLabel.text = String("\(viewCount * 113) kez görüntülendi.")
        }
       
        
        
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
    
   
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        nameLabel.text = ""
//        numberOfFollowersLabel.text = ""
//        numberOfEngagementRateLabel.text = ""
//        imageView.image = nil
//        numberOfViewsLabel.text = ""
//    }
}
