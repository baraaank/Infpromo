//
//  StarsView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 23.05.2022.
//

import UIKit

class StarsView: UIView {

    let firstStar: UIImageView = {
       let image = UIImage(systemName: "star.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let secondStar: UIImageView = {
       let image = UIImage(systemName: "star.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let thirdStar: UIImageView = {
       let image = UIImage(systemName: "star.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let fourthStar: UIImageView = {
       let image = UIImage(systemName: "star.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let fifthStar: UIImageView = {
       let image = UIImage(systemName: "star.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let starsStackView: UIStackView = {
       let stackView = UIStackView()

        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(starsStackView)
        starsStackView.addArrangedSubview(firstStar)
        starsStackView.addArrangedSubview(secondStar)
        starsStackView.addArrangedSubview(thirdStar)
        starsStackView.addArrangedSubview(fourthStar)
        starsStackView.addArrangedSubview(fifthStar)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        starsStackView.frame = bounds
    }
    
}
