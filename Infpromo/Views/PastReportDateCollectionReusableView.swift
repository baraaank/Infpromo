//
//  PastReportDateCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 24.02.2022.
//

import UIKit

class PastReportDateCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "pastReportDateCollectionReusableViewIdentifier"
    static let kind = "pastReportDateCollectionReusableViewKind"
    
    private let reusableViewButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(reusableViewButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(reusableViewButton)
        clipsToBounds = true
        layer.cornerRadius = width / 2
        backgroundColor = .purple
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reusableViewButton.frame = bounds
    }
    
    @objc func reusableViewButtonClicked(button: UIButton) {
        if button.backgroundColor == .brown {
            button.backgroundColor = .red
        } else {
            button.backgroundColor = .brown
        }
        
        print("clicked")
    }
}


