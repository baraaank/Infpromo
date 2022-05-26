//
//  SliderCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 23.05.2022.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "sliderCollectionViewCellIdentifier"
    
    private let sliderImageView: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let usernameButton: CustomFilterButton = {
       let button = CustomFilterButton()
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor().infpromo, for: .normal)
        return button
    }()
    
    private let textView: UITextView = {
       let textView = UITextView()
        textView.attributedText = NSAttributedString(string: "--", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private let starView = StarsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    func addSubviews() {
        contentView.addSubview(sliderImageView)
        contentView.addSubview(usernameButton)
        contentView.addSubview(starView)
        contentView.addSubview(textView)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfHeight = height / 8
        usernameButton.frame = CGRect(x: 10, y: 10, width: (width / 2) - 20, height: oneOfHeight)
        starView.frame = CGRect(x: 10, y: usernameButton.bottom, width: (width / 2) - 20, height: oneOfHeight)
        sliderImageView.frame = CGRect(x: (width - 10) - (oneOfHeight * 2), y: 10, width: oneOfHeight * 2, height: oneOfHeight * 2)
        textView.frame = CGRect(x: 10, y: starView.bottom + 10, width: width - 20, height: oneOfHeight * 4)
        nameLabel.frame = CGRect(x: 10, y: textView.bottom + 10, width: (width / 2), height: oneOfHeight)
    }
    
    func handleImageSlide(with image: UIImage) {
        sliderImageView.image = image
    }
    
    
    func handleCellDatas(with model: LogInSignUpViewModel) {
        usernameButton.setTitle("@\(model.username)", for: .normal)
        sliderImageView.image = UIImage(named: model.image)
        textView.text = "\"\(model.commentText)\""
        nameLabel.text = model.name
    }
}
