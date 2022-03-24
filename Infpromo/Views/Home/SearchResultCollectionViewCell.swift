//
//  SearchResultCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 20.02.2022.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "searchResultCollectionViewCellIdentifier"
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "pp")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cemal Can Cansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private  let usernameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "@cemalcancansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "3,2M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçi", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfEngagementsAndRatesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "1,1M (7.34 %)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        label.textAlignment = .center
        
        return label
    }()
    
    private let engagementsAndRatesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Etkileşimler ve Oranı", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        button.setAttributedTitle(NSAttributedString(string: "Detay -1", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        return button
    }()
    
    
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
        addSubview(numberOfFollowersLabel)
        addSubview(followersLabel)
        addSubview(numberOfEngagementsAndRatesLabel)
        addSubview(engagementsAndRatesLabel)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 10, y: height / 2 - width / 10, width: width / 5, height: width / 5)
        imageView.layer.cornerRadius = width / 10
//        nameLabel.frame = CGRect(x: 10, y: imageView.bottom + 5, width: 160, height: 20)
//        usernameLabel.frame = CGRect(x: 10, y: nameLabel.bottom + 5, width: 160, height: 20)
//        numberOfFollowersLabel.frame = CGRect(x: imageView.right + 30, y: 20, width: 80, height: 20)
//        followersLabel.frame = CGRect(x: imageView.right + 30, y: numberOfFollowersLabel.bottom + 5, width: 80, height: 20)
//        numberOfEngagementsAndRatesLabel.frame = CGRect(x: numberOfFollowersLabel.right + 30, y: 20, width: width - 240, height: 20)
//        engagementsAndRatesLabel.frame = CGRect(x: followersLabel.right + 30, y: numberOfEngagementsAndRatesLabel.bottom + 5, width: width - 240, height: 20)
////        button.frame = CGRect(x: imageView.right + 110, y: imageView.bottom + 10, width: 150, height: 50)
//        button.frame = CGRect(x: width - 120, y: height - 65, width: 100, height: 40)
        
       
        numberOfEngagementsAndRatesLabel.frame = CGRect(x: imageView.right + 5, y: 10, width: width / 2.2, height: 20)
        engagementsAndRatesLabel.frame = CGRect(x: imageView.right + 5, y: numberOfEngagementsAndRatesLabel.bottom , width: width / 2.2, height: 20)
        
        
        numberOfFollowersLabel.frame = CGRect(x: numberOfEngagementsAndRatesLabel.right + 5, y: 10, width: width / 3.8, height: 20)
        followersLabel.frame = CGRect(x: numberOfFollowersLabel.left, y: numberOfFollowersLabel.bottom , width: width / 3.8, height: 20)
        
        nameLabel.frame = CGRect(x: numberOfEngagementsAndRatesLabel.left, y: engagementsAndRatesLabel.bottom + 15, width: width / 2.2, height: 20)
        usernameLabel.frame = CGRect(x: nameLabel.left, y: nameLabel.bottom, width: width / 2.2, height: 20)
        
        button.frame = CGRect(x: nameLabel.right + 5, y: followersLabel.bottom + 15, width: width / 3.8, height: 40)
        
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
        
        
    }
}
