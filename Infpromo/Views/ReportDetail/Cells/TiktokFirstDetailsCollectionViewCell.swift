//
//  TiktokFirstDetailsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 11.05.2022.
//

import UIKit

class TiktokFirstDetailsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "tiktokFirstDetailsCollectionViewCellIdentifier"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        //        button.imageView?.tintColor = UIColor().infpromo
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        return label
    }()
    
    private let firstInfoLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.01
        return label
    }()
    
    let secondInfoLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .white
        addSubviews()
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(numberLabel)
        contentView.addSubview(firstInfoLabel)
        contentView.addSubview(secondInfoLabel)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let oneTwenty = height / 20
        let imageHeight = width / 3
        imageView.frame = CGRect(x: (width / 2) - (imageHeight / 2), y: oneTwenty * 2, width: imageHeight, height: imageHeight)
        imageView.layer.cornerRadius = imageView.width / 2
        numberLabel.frame = CGRect(x: 10, y: imageView.bottom + oneTwenty, width: width - 20, height: oneTwenty * 2)
        firstInfoLabel.frame = CGRect(x: 10, y: numberLabel.bottom + oneTwenty, width: width - 20, height: oneTwenty * 2)
        secondInfoLabel.frame = CGRect(x: 10, y: firstInfoLabel.bottom + oneTwenty, width: width - 20, height: oneTwenty * 4)
    }
    
    
    func configureCell(with model: SFImagesForReport) {
        let config = UIImage.SymbolConfiguration(weight: .regular)
        imageView.image = UIImage(systemName: model.image)?.withTintColor(UIColor().infpromo, renderingMode: .alwaysOriginal).withConfiguration(config)
        
        
        firstInfoLabel.attributedText = NSAttributedString(string: model.explanation, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        
    }
    
    
    func changeColorLabel(colors: UIColor) {
        
            secondInfoLabel.textColor = colors
        
            
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        secondInfoLabel.textColor = nil
    }
}
