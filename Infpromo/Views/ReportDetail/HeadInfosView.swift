//
//  HeadInfosView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 30.04.2022.
//

import UIKit

class HeadInfosView: UIView {
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
//        label.backgroundColor = .black
        label.text = "---"
        label.textAlignment = .center
        return label
    }()
    

    
    let usernameButton: UIButton = {
        let button = UIButton()
        button.setTitle("---", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let divideByTen = height / 18
        
        profileImageView.frame = CGRect(x: (width / 2) - (height / 4), y: divideByTen, width: height / 2, height: height / 2)
        profileImageView.layer.cornerRadius = profileImageView.width / 2
        nameLabel.frame = CGRect(x: 40, y: profileImageView.bottom + divideByTen, width: width - 80, height: divideByTen * 2.5)
        usernameButton.frame = CGRect(x: 40, y: nameLabel.bottom + divideByTen, width: width - 80, height: divideByTen * 2.5)
    }
}
