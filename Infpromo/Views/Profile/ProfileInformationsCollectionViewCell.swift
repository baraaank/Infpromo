//
//  ProfileInformationsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.03.2022.
//

import UIKit

class ProfileInformationsCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("aaaasssss")
    }
    
    
    
    static let reuseIdentifier = "profileInformationsCollectionViewCellIdentifier"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "person", withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor().infpromo
        imageView.clipsToBounds = true
        imageView.image = image
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "aaa", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
//    let editingTextField: UITextField = {
//       let textField = UITextField()
//
//
//        textField.attributedText = NSAttributedString(string: "-", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
//
////        textField.textColor = UIColor.lightGray
//
//        return textField
//    }()
    
    let informationsLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "henüz girilmemiş..", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        configureCell()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(iconImageView)
        addSubview(headerLabel)
        contentView.addSubview(informationsLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = CGRect(x: 10, y: 10, width: height - 20, height: height - 20)
//        iconImageView.layer.cornerRadius = (height - 20) / 2
        headerLabel.frame = CGRect(x: iconImageView.right + 10, y: 8, width: width / 2, height: (height / 2) - 10)
        informationsLabel.frame = CGRect(x: iconImageView.right + 10, y: headerLabel.bottom + 6, width: width / 2, height: (height / 2) - 10)
    }
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
//        layer.shadowRadius = 4.0
//
//        // The color of the drop shadow
//        layer.shadowColor = UIColor.lightGray.cgColor
//
//        // How transparent the drop shadow is
//        layer.shadowOpacity = 0.4
//
//        // How far the shadow is offset from the UICollectionViewCell’s frame
//        layer.shadowOffset = CGSize(width: 0, height: 3)
//        
//        
    }
    
    func fillInfos(with: ProfileInformationOptions) {
        iconImageView.image = UIImage(systemName: with.icon, withConfiguration: UIImage.SymbolConfiguration.init(weight: .medium))
        headerLabel.text = with.header
        
    }
    
    
    func fillWithInfos(with viewModel: String) {
        if viewModel != "" {
            informationsLabel.text = viewModel
            informationsLabel.textColor = .black
        } else {
            informationsLabel.text = "henüz girilmemiş.."
            informationsLabel.textColor = .lightGray
        }
        
        
        
    }
    
    //with the update button text field going to be editing state
    
}
