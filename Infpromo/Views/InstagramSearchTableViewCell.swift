//
//  InstagramSearchTableViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 5.03.2022.
//

import UIKit

class InstagramSearchTableViewCell: UITableViewCell {

    static let reuseIdentifier = "instagramSearchTableViewCellIdentifier"
    
    
    
    private let selectButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        
        button.imageView?.tintColor = UIColor().infpromo
        return button
    }()
    
    private let optionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor().infpromo
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(selectButton)
        addSubview(optionsLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectButton.frame = CGRect(x: 20, y: 10, width: 20, height: 20)
        optionsLabel.frame = CGRect(x: 50, y: 10, width: frame.size.width - 60, height: 20)
    }
    
    func fillOptions(with: SearchHeadings, index: Int) {
        optionsLabel.text = with.options[index]
    }
    
}


