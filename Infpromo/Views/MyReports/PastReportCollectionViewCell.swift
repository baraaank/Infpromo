//
//  PastReportCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 21.02.2022.
//

import UIKit

class PastReportCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "pastReportCollectionViewCellIdentifier"
    
    var initialFrame: CGRect?
    var initialCornerRadius: CGFloat?
    
    
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "pp")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cemal Can Cansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium)])
//        label.textAlignment = .center
        
        return label
    }()
    
    private  let usernameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "@cemalcancansever", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
//        label.textAlignment = .center
        
        return label
    }()


    private let followersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçi", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.textAlignment = .center
        
        return label
    }()

    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "1,1M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium)])
        label.textAlignment = .center
        
        
        return label
    }()
    
    private let numberOfEngagementsLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "7.34 %", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium)])
        label.textAlignment = .center
        
        return label
    }()

    private let engagementsAndRatesLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Etkileşimler ve Oranı", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        // add line break
        label.textAlignment = .center
        
        return label
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        button.setTitle("Detay", for: .normal)
        return button
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Alındığı Tarih", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    private let originalDateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cts, 12 Eyl 2021 21:20", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    private let platformLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Platform", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    private let originalPlatformLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Instagram", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        // add line break
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureCell()
        changeLayoutLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(numberOfFollowersLabel)
        addSubview(numberOfEngagementsLabel)
        
    }
    
    
    func changeLayoutLabels() {
        imageView.frame = CGRect(x: 10, y: 10, width: width / 5, height: width / 5)
        imageView.layer.cornerRadius = width / 10
        
        nameLabel.frame = CGRect(x: imageView.right + 10, y: width / 10 - 20 + 5, width: width / 2.2, height: 30)
        usernameLabel.frame = CGRect(x: imageView.right + 10, y: nameLabel.bottom, width: width / 2.2, height: 30)
        numberOfFollowersLabel.frame = CGRect(x: nameLabel.right + 10, y: width / 10 - 20, width: width / 4, height: 30)
        numberOfEngagementsLabel.frame = CGRect(x: usernameLabel.right + 10, y: numberOfFollowersLabel.bottom + 5, width: width / 4, height: 30)
    }
    
    override func layoutSubviews() {
        
        
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
        
    }
}


extension PastReportCollectionViewCell {
    
    
    func expand(in collectionView: UICollectionView) {
        initialFrame = self.frame
        initialCornerRadius = self.contentView.layer.cornerRadius
        
        self.contentView.layer.cornerRadius = 0
        
        if width < 400 {
            frame = CGRect(x: 8, y: collectionView.contentOffset.y + width / 2.2, width: collectionView.frame.width - 16, height: collectionView.frame.height - width / 1.1)
        } else {
            frame = CGRect(x: 8, y: collectionView.contentOffset.y + width / 1.44, width: collectionView.frame.width - 16, height: collectionView.frame.height - width / 0.72)
        }
        
        addSubview(followersLabel)
        addSubview(numberOfFollowersLabel)
        addSubview(engagementsAndRatesLabel)
        addSubview(button)
        addSubview(dateLabel)
        addSubview(originalDateLabel)
        addSubview(platformLabel)
        addSubview(originalPlatformLabel)
        
        dateLabel.frame = CGRect(x: 10, y: 10, width: width / 2 - 20, height: 30)
        originalDateLabel.frame = CGRect(x: 10, y: dateLabel.bottom, width: width / 2 - 20, height: 30)
        
        platformLabel.frame = CGRect(x: dateLabel.right + 10, y: 10, width: width / 2 - 20, height: 30)
        originalPlatformLabel.frame = CGRect(x: dateLabel.right + 10, y: platformLabel.bottom, width: width / 2 - 20, height: 30)
        
        imageView.frame = CGRect(x: width / 2 - width / 10, y: originalPlatformLabel.bottom + 10, width: width / 5, height: width / 5)
        imageView.layer.cornerRadius = width / 10
        
        nameLabel.frame = CGRect(x: width / 2 - width / 4, y: imageView.bottom + 5, width: width / 2, height: 30)
        usernameLabel.frame = CGRect(x: width / 2 - width / 4, y: nameLabel.bottom, width: width / 2, height: 30)
        
        numberOfFollowersLabel.frame = CGRect(x: 10, y: usernameLabel.bottom + 5, width: width / 2 - 20, height: 30)
        followersLabel.frame = CGRect(x: 10, y: numberOfFollowersLabel.bottom, width: width / 2 - 20, height: 30)
        
        numberOfEngagementsLabel.frame = CGRect(x: followersLabel.right + 10, y: usernameLabel.bottom + 5, width: width / 2 - 20, height: 30)
        engagementsAndRatesLabel.frame = CGRect(x: followersLabel.right + 10, y: numberOfFollowersLabel.bottom, width: width / 2 - 20, height: 30)
        
        button.frame = CGRect(x: 80, y: engagementsAndRatesLabel.bottom + 10, width: width - 160, height: 40)
        
        
        
//        dateLabel.isHidden = false
//        originalDateLabel.isHidden = false
//        platformLabel.isHidden = false
//        originalPlatformLabel.isHidden = false
//        followersLabel.isHidden = false
//        engagementsAndRatesLabel.isHidden = false
//        button.isHidden = false
        nameLabel.textAlignment = .center
        usernameLabel.textAlignment = .center
        

        
        
        layoutIfNeeded()
    }
    
    func collapse() {
        
        dateLabel.removeFromSuperview()
        originalDateLabel.removeFromSuperview()
        platformLabel.removeFromSuperview()
        originalPlatformLabel.removeFromSuperview()
        followersLabel.removeFromSuperview()
        engagementsAndRatesLabel.removeFromSuperview()
        button.removeFromSuperview()
        
        
        
        self.contentView.layer.cornerRadius = initialCornerRadius ?? self.contentView.layer.cornerRadius
        self.frame = initialFrame ?? self.frame
        
        

        
        initialFrame = nil
        initialCornerRadius = nil
        
//        dateLabel.isHidden = true
//        originalDateLabel.isHidden = true
//        platformLabel.isHidden = true
//        originalPlatformLabel.isHidden = true
//        followersLabel.isHidden = true
//        engagementsAndRatesLabel.isHidden = true
//        button.isHidden = true
        
        
        changeLayoutLabels()
        nameLabel.textAlignment = .left
        usernameLabel.textAlignment = .left

        
        
    }
    
    func hide(in collectionView: UICollectionView, frameOfSelectedCell: CGRect) {
        initialFrame = self.frame
        
        
        let currentY = self.frame.origin.y
        let newY: CGFloat
        if width < 400 {
            if currentY < frameOfSelectedCell.origin.y {
                let offset = frameOfSelectedCell.origin.y - currentY - width / 2.2
                newY = collectionView.contentOffset.y - offset
            } else {
                let offset = currentY - frameOfSelectedCell.maxY - width / 2.2
                newY = collectionView.contentOffset.y + collectionView.frame.height + offset
            }
        } else {
            if currentY < frameOfSelectedCell.origin.y {
                
                let offset = frameOfSelectedCell.origin.y - currentY - width / 1.44
                newY = collectionView.contentOffset.y - offset
            } else {
                let offset = currentY - frameOfSelectedCell.maxY - width / 1.44
                newY = collectionView.contentOffset.y + collectionView.frame.height + offset
            }
        }
        
        
        self.frame.origin.y = newY
          
          layoutIfNeeded()
    }
    
    func show() {
        self.frame = initialFrame ?? self.frame
           
           initialFrame = nil
           
           layoutIfNeeded()
        
    }
}
