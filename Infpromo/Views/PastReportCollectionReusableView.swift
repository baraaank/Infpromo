//
//  PastReportCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.02.2022.
//

import UIKit

class PastReportCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "PastReportViewReuseIdentifier"
    static let kind = "PastReportKind"
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = width / 2
        addSubview(button)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = bounds
    }
}
