//
//  FollowersFilterCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 3.04.2022.
//

import UIKit

class FollowersFilterCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "followersFilterCollectionViewCellIdentifier"
    
    
    let label: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "labelText"
        label.layer.cornerRadius = 6
        return label
    }()
    
    let button: CustomFilterButton = {
       let button = CustomFilterButton()
//        button.backgroundColor = .red
        button.layer.cornerRadius = 6
        button.setImage(UIImage(systemName: "xmark.square"), for: .normal)
        button.imageView?.tintColor = UIColor().infpromo
//        button.setTitleColor(UIColor().infpromo, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(button)
        configureCell()
        contentView.layer.cornerRadius = 4
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor().infpromo.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
//            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 2),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            button.widthAnchor.constraint(equalToConstant: 20),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    
    func configureCellLabel(with string: String) {
        label.text = string
    }
    
    
}
