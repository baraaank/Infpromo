//
//  UserMetricsView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 30.04.2022.
//

import UIKit

class UserMetricsView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let firstInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.01
        return label
    }()
    
    let secondInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(numberLabel)
        addSubview(firstInfoLabel)
        addSubview(secondInfoLabel)
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
