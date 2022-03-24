//
//  ProfileInformationsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.03.2022.
//

import UIKit

class ProfileInformationsCollectionViewCell: UICollectionViewCell, UITextFieldDelegate, ProfileInformationCollectionReusableViewDelegate {
    func didTappedButton(textField: UITextField) {
        profileReusable.delegate = self
        textField.backgroundColor = .red
        print("here")
    }
    
    

    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("aaaasssss")
    }
    
    var profileReusable = ProfileInformationCollectionReusableView()
    
    static let reuseIdentifier = "profileInformationsCollectionViewCellIdentifier"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "aaa", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    let editingTextField: UITextField = {
       let textField = UITextField()
        
        
//        textField.attributedText = NSAttributedString(string: "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textField.textColor = UIColor.lightGray
    
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        editingTextField.delegate = self
        addSubviews()
        configureCell()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(iconImageView)
        addSubview(headerLabel)
        contentView.addSubview(editingTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = CGRect(x: 10, y: 10, width: height - 20, height: height - 20)
//        iconImageView.layer.cornerRadius = (height - 20) / 2
        headerLabel.frame = CGRect(x: iconImageView.right + 10, y: 5, width: width / 2, height: (height / 2) - 10)
        editingTextField.frame = CGRect(x: iconImageView.right + 10, y: headerLabel.bottom + 10, width: width / 2, height: (height / 2) - 10)
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
        iconImageView.image = UIImage(systemName: with.icon)
        headerLabel.text = with.header
        editingTextField.text = with.infos
    }
    
    //with the update button text field going to be editing state
    
}
