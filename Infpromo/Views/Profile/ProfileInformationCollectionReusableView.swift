//
//  ProfileInformationCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 10.03.2022.
//

import UIKit

protocol ProfileInformationCollectionReusableViewDelegate: AnyObject {
    func didTappedButton(textField: UITextField)
}

class ProfileInformationCollectionReusableView: UICollectionReusableView {
       
    static let reuseIdentifier = "profileInformationCollectionReusableViewIdentifier"
    static let kind = "profileInformationCollectionReusableViewKind"
    
    weak var delegate: ProfileInformationCollectionReusableViewDelegate?
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        button.setTitle("Güncelle", for: .normal)
        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
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
    
    @objc func updateButtonTapped() {
        delegate?.didTappedButton(textField: UITextField())
    }
    
}
