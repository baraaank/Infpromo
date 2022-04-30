//
//  LastPostsView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 30.04.2022.
//

import UIKit

class LastPostsView: UIView {

    let dateLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let heartImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let commentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "text.bubble")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let likeslabel: UILabel = {
       let label = UILabel()
        
        label.text = "-----"
        return label
    }()
    
    let commentslabel: UILabel = {
       let label = UILabel()
        
        label.text = "-----"
        return label
    }()
    
    let firstStackView: UIStackView = {
       let stackView = UIStackView()
//        stackView.backgroundColor = .black
        return stackView
    }()
    
    let secondStackView: UIStackView = {
       let stackView = UIStackView()
//        stackView.backgroundColor = .black
        return stackView
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
        addSubview(dateLabel)
        addSubview(photoImageView)
        addSubview(firstStackView)
        addSubview(secondStackView)

        firstStackView.addArrangedSubview(heartImageView)
        firstStackView.addArrangedSubview(likeslabel)
        secondStackView.addArrangedSubview(commentImageView)
        secondStackView.addArrangedSubview(commentslabel)
        firstStackView.distribution = .fillEqually
        secondStackView.distribution = .fillEqually

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfTwenty = height / 24
        dateLabel.frame = CGRect(x: 10, y: oneOfTwenty, width: width - 20, height: oneOfTwenty * 2)
        photoImageView.frame = CGRect(x: 10, y: dateLabel.bottom + oneOfTwenty, width: width - 20, height: width * 0.6)
        firstStackView.frame = CGRect(x: 20, y: photoImageView.bottom + oneOfTwenty, width: width - 40, height: height - dateLabel.height - photoImageView.height - oneOfTwenty * 8)
        secondStackView.frame = CGRect(x: 20, y: firstStackView.bottom + oneOfTwenty, width: width - 40, height: height - dateLabel.height - photoImageView.height - oneOfTwenty * 8)
    }

}
