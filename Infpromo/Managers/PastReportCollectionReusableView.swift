//
//  PastReportCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.02.2022.
//

import UIKit

protocol PastReportCollectionReusableViewDelegate: AnyObject {
    func didChangeLayout()
}

class PastReportCollectionReusableView: UICollectionReusableView {
    
    weak var delegate: PastReportCollectionReusableViewDelegate?
    
    static let reuseIdentifier = "pastReportCollectionReusableViewIdentifier"
    static let kind = "pastReportCollectionReusableViewKind"
    
    private let reusableViewButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(reusableViewButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = width / 2
        
        addSubview(reusableViewButton)
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
        
        delegate?.didChangeLayout()
    }
}
