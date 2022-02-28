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
        label.attributedText = NSAttributedString(string: "1234 kez görüntülendi.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.systemBlue])
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
        label.attributedText = NSAttributedString(string: "Cemal Can", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.systemBlue])
        label.textAlignment = .center
        return label
    }()
    
    private let numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "3.2M", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        return label
    }()
    
    private let numberOfEngagementRateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "4.62 %", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Detay -1", for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
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
        numberOfViewsLabel.frame = CGRect(x: 10, y: 10, width: width - 20, height: 20)
        imageView.frame = CGRect(x: width / 4, y: numberOfViewsLabel.bottom + 10, width: width / 2, height: width / 2)
        imageView.layer.cornerRadius = width / 4
        nameLabel.frame = CGRect(x: width / 6, y: imageView.bottom + 10, width: width / 1.5, height: 20)
        numberOfFollowersLabel.frame = CGRect(x: width / 6, y: nameLabel.bottom + 10, width: width / 1.5, height: 20)
        numberOfEngagementRateLabel.frame = CGRect(x: width / 6, y: numberOfFollowersLabel.bottom + 10, width: width / 1.5, height: 20)
        button.frame = CGRect(x: width / 6, y: numberOfEngagementRateLabel.bottom + 10, width: width / 1.5, height: 30)
    }
    
    
}
