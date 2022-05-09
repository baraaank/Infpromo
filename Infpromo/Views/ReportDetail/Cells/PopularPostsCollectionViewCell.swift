//
//  PopularPostsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class PopularPostsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "popularPostsCollectionViewCellIdentifier"
    
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        return label
    }()
    
    let photoImageView: CustomImageView = {
       let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
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
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        return label
    }()
    
    let commentslabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
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
        backgroundColor = .white
        addSubviews()
    }
    
    func addSubviews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(photoImageView)
        contentView.addSubview(firstStackView)
        contentView.addSubview(secondStackView)
//        firstStackView.addSubview(heartImageView)
//        firstStackView.addSubview(likeslabel)
//        secondStackView.addSubview(commentImageView)
//        secondStackView.addSubview(commentslabel)
        
        firstStackView.addArrangedSubview(heartImageView)
        firstStackView.addArrangedSubview(likeslabel)
        secondStackView.addArrangedSubview(commentImageView)
        secondStackView.addArrangedSubview(commentslabel)
        firstStackView.distribution = .fillEqually
        secondStackView.distribution = .fillEqually
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfTwenty = height / 24
        dateLabel.frame = CGRect(x: 10, y: oneOfTwenty, width: width - 20, height: oneOfTwenty * 2)
        photoImageView.frame = CGRect(x: 10, y: dateLabel.bottom + oneOfTwenty, width: width - 20, height: width * 0.6)
        firstStackView.frame = CGRect(x: 20, y: photoImageView.bottom + oneOfTwenty, width: width - 40, height: height - dateLabel.height - photoImageView.height - oneOfTwenty * 7.2)
        secondStackView.frame = CGRect(x: 20, y: firstStackView.bottom + oneOfTwenty, width: width - 40, height: height - dateLabel.height - photoImageView.height - oneOfTwenty * 7.2)
        
    }
    
    
    func configureCell(with viewModel: PopularPostViewModel) {
        let imageURL = viewModel.image
        photoImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
        
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMM yyyy"
        
        guard let date: Date = dateFormatterGet.date(from: viewModel.created) else {
            dateLabel.attributedText = NSAttributedString(string: "Tarih: ---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
            return
        }
        
        
        
        dateLabel.attributedText = NSAttributedString(string: "Tarih: \(dateFormatterPrint.string(from: date))", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        commentslabel.attributedText = NSAttributedString(string: "\(viewModel.clearComments)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])
        likeslabel.attributedText = NSAttributedString(string: "\(viewModel.clearLikes)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.black])

    }
}
