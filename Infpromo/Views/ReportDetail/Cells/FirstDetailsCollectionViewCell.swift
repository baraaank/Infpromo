//
//  FirstDetailsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class FirstDetailsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "firstDetailsCollectionViewCellIdentifier"
    
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    private let firstInfoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    private let secondInfoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
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
}