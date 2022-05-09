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
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ileri", for: .normal)
        button.setAttributedTitle(NSAttributedString(string: "İleri", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor().infpromo.cgColor
        button.backgroundColor = UIColor().infpromo
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
        button.frame = CGRect(x: 120, y: 40, width: width - 240, height: height - 80)
    }
    
}
