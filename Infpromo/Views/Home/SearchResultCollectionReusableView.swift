//
//  SearchResultCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.03.2022.
//

import UIKit

class SearchResultCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "searchResultCollectionReusableViewIdentifier"
    static let kind = "searchResultCollectionReusableViewKind"
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor().infpromo.cgColor
        button.backgroundColor = .white
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
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 70, y: 40, width: width - 140, height: height - 80)
    }
    
}
