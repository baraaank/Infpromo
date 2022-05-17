//
//  ProfileInformationCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 10.03.2022.
//

import UIKit



class ProfileInformationCollectionReusableView: UICollectionReusableView {
       
    static let reuseIdentifier = "profileInformationCollectionReusableViewIdentifier"
    static let kind = "profileInformationCollectionReusableViewKind"
    
    
    let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        button.setAttributedTitle(NSAttributedString(string: "Güncelle", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(updateButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateButton.frame = CGRect(x: 50, y: 20, width: width - 100, height: height - 40)
    }
    
    
    
}
