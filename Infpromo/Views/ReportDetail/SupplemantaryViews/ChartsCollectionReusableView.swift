//
//  ChartsCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class ChartsCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "chartsCollectionReusableViewIdentifier"
    static let kind = "chartsCollectionReusableViewKind"
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Graphs"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(label)
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
