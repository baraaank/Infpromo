//
//  MyReportsDateCollectionReusableView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 28.03.2022.
//

import UIKit
import SkeletonView

class MyReportsDateCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "myReportsDateCollectionReusableViewIdentifier"
    static let kind = "myReportsDateCollectionReusableViewKind"
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)])
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dateLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        dateLabel.frame = bounds
    }
    
    func configureCell(with string: String) {
        

        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "E, d MMM yyyy HH:mm"
        
        guard let date: Date = dateFormatterGet.date(from: string) else {
            dateLabel.text = "Alındığı tarih: ----"
            return
        }
        

        dateLabel.text = "Alındığı tarih: \(dateFormatterPrint.string(from: date))"
    }
}
