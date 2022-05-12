//
//  PercentsFollowersView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import UIKit

class PercentsFollowersView: UIView {
    
    private let iconView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: "-", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textColor = .black
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let text = "Reel Takipçi Oranı (Fake olmayan)"
        label.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        let text = ""
        label.numberOfLines = 0
        label.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(iconView)
        addSubview(percentLabel)
        addSubview(titleLabel)
        addSubview(infoLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfHeight = height / 24
        
        iconView.frame = CGRect(x: (width / 2) - 30, y: oneOfHeight, width: 60, height: 60)
        iconView.layer.cornerRadius = 30
        percentLabel.frame = CGRect(x: 10, y: iconView.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 3)
        titleLabel.frame = CGRect(x: 10, y: percentLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 4)
        infoLabel.frame = CGRect(x: 10, y: titleLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 3)
    }
    
    func configurePercentage(with: CredibilityViewModel, title: String, info: String?) {
        
        
        percentLabel.text = "% \(with.clearCredibility)"
        titleLabel.text = title
        
        if with.clearCredibility == 0.0 {
            percentLabel.text = "% NaN"
        }
        
        if let info = info {
            
            infoLabel.attributedText = NSAttributedString(string: info, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
            
        }
    }
    
}
