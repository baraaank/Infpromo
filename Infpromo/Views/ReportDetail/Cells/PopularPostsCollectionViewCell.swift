//
//  PopularPostsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class PopularPostsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "popularPostsCollectionViewCellIdentifier"
    
    
    let datelabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let heartImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let commentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let likeslabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    let commentslabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    let stacksStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.backgroundColor = .black
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubviews()
    }
    
    func addSubviews() {
        contentView.addSubview(datelabel)
        contentView.addSubview(photoImageView)
        contentView.addSubview(stacksStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfTwenty = height / 24
        datelabel.frame = CGRect(x: 10, y: oneOfTwenty, width: width - 20, height: oneOfTwenty * 2)
        photoImageView.frame = CGRect(x: 10, y: datelabel.bottom + oneOfTwenty, width: width - 20, height: width * 0.6)
        stacksStackView.frame = CGRect(x: 20, y: photoImageView.bottom + oneOfTwenty, width: width - 40, height: height - datelabel.height - photoImageView.height - oneOfTwenty * 4)
    }
}
