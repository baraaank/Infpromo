//
//  MostVisitedReportsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 20.02.2022.
//

import UIKit

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
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Cemal Can", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "3.2M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        
        return label
    }()
    
    private let numberOfEngagementRateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "4.62 %", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.gray])
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
        addSubview(numberOfViewsLabel)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(numberOfFollowersLabel)
        addSubview(numberOfEngagementRateLabel)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        numberOfViewsLabel.frame = CGRect(x: 10, y: 5, width: width - 20, height: 20)
        imageView.frame = CGRect(x: width / 4, y: numberOfViewsLabel.bottom + 5, width: width / 2, height: width / 2)
        imageView.layer.cornerRadius = width / 4
        nameLabel.frame = CGRect(x: width / 6, y: imageView.bottom + 5, width: width / 1.5, height: 20)
        numberOfFollowersLabel.frame = CGRect(x: width / 6, y: nameLabel.bottom + 5, width: width / 1.5, height: 20)
        numberOfEngagementRateLabel.frame = CGRect(x: width / 6, y: numberOfFollowersLabel.bottom + 5, width: width / 1.5, height: 20)
        button.frame = CGRect(x: width / 6, y: numberOfEngagementRateLabel.bottom + 5, width: width / 1.5, height: 30)
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
    
    
}
