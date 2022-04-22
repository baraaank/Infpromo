//
//  ChartsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import UIKit

class ChartsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "chartsCollectionViewCellIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
