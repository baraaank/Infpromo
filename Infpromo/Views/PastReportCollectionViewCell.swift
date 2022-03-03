//
//  PastReportCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 21.02.2022.
//

import UIKit

class PastReportCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "pastReportCollectionViewCellIdentifier"
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "pp")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cemal Can Cansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold)])
//        label.textAlignment = .center
        
        return label
    }()
    
    private  let usernameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "@cemalcancansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
//        label.textAlignment = .center
        
        return label
    }()
//
//    private let numberOfFollowersLabel: UILabel = {
//        let label = UILabel()
//        label.attributedText = NSAttributedString(string: "3,2M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold)])
//        label.textAlignment = .center
//        return label
//    }()
//
//    private let followersLabel: UILabel = {
//        let label = UILabel()
//        label.attributedText = NSAttributedString(string: "Takipçi", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
//        label.textAlignment = .center
//        return label
//    }()
//
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "1,1M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfEngagementsLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "7.34 %", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold)])
        label.textAlignment = .center
        
        return label
    }()
//
//    private let engagementsAndRatesLabel: UILabel = {
//        let label = UILabel()
//        label.attributedText = NSAttributedString(string: "Etkileşimler ve Oranı", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
//        // add line break
//        label.textAlignment = .center
//        return label
//    }()
//
//    private let button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 4
//        button.setTitle("Detay -1", for: .normal)
//        return button
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
//        addSubview(numberOfFollowersLabel)
//        addSubview(followersLabel)
        addSubview(numberOfFollowersLabel)
        addSubview(numberOfEngagementsLabel)
//        addSubview(engagementsAndRatesLabel)
//        addSubview(button)
    }
    
    override func layoutSubviews() {
        imageView.frame = CGRect(x: 10, y: 10, width: width / 5, height: width / 5)
        imageView.layer.cornerRadius = width / 10
//        nameLabel.frame = CGRect(x: 10, y: imageView.bottom + 10, width: 160, height: 20)
//        usernameLabel.frame = CGRect(x: 10, y: nameLabel.bottom + 10, width: 160, height: 20)
//        numberOfFollowersLabel.frame = CGRect(x: imageView.right + 30, y: 20, width: 80, height: 20)
//        followersLabel.frame = CGRect(x: imageView.right + 30, y: numberOfFollowersLabel.bottom + 10, width: 80, height: 20)
//        numberOfEngagementsAndRatesLabel.frame = CGRect(x: numberOfFollowersLabel.right + 30, y: 20, width: width - 240, height: 20)
//        engagementsAndRatesLabel.frame = CGRect(x: followersLabel.right + 30, y: numberOfEngagementsAndRatesLabel.bottom + 10, width: width - 240, height: 20)
//        button.frame = CGRect(x: imageView.right + 110, y: imageView.bottom + 10, width: 150, height: 50)
        
        nameLabel.frame = CGRect(x: imageView.right + 10, y: width / 10 - 20, width: width / 2.2, height: 30)
        usernameLabel.frame = CGRect(x: imageView.right + 10, y: width / 10, width: width / 2.2, height: 30)
        numberOfFollowersLabel.frame = CGRect(x: nameLabel.right + 10, y: width / 10 - 20, width: width / 4, height: 30)
        numberOfEngagementsLabel.frame = CGRect(x: usernameLabel.right + 10, y: width / 10, width: width / 4, height: 30)
        
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

