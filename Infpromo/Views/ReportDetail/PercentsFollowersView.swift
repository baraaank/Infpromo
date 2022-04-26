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
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reel Takipçi Oranı (Fake olmayan)"
        
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "(Influencer'ı takip edip, aktif olmayan kullanıcılar baz alınarak hesaplanmıştır.)"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
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
        let oneOfHeight = height / 16
        
        iconView.frame = CGRect(x: (width / 2) - 30, y: oneOfHeight, width: 60, height: 60)
        iconView.layer.cornerRadius = 30
        percentLabel.frame = CGRect(x: 10, y: iconView.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        titleLabel.frame = CGRect(x: 10, y: percentLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        infoLabel.frame = CGRect(x: 10, y: titleLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
    }
    
    func configurePercentage(with: CredibilityViewModel) {
        percentLabel.text = "% \(with.clearCredibility)"
    }
}
