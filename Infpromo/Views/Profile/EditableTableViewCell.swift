//
//  EditableTableViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.05.2022.
//

import UIKit

class EditableTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "editableTableViewCellIdentifier"

    let infoLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    let infoTextField: UITextField = {
       let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "henüz girilmemiş..", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return textField
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(infoLabel)
        contentView.addSubview(infoTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        infoLabel.frame = CGRect(x: 8, y: 0, width: (width / 3) - 8, height: height)
        infoTextField.frame = CGRect(x: infoLabel.right, y: 0, width: (2 * width) / 3, height: height)
    }
    
    
    func configureLabel(_ text: String) {
        infoLabel.text = text
    }
    
    func configureTextField(_ text: String) {
        infoTextField.text = text
    }
    
    
}
