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
        
//            
//        var str = "2013-07-21T19:32:00Z"
//
//        var dateFor = DateFormatter()
//        dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//
//        var yourDate: NSDate? = dateFor.date(from: string) as NSDate?
//
//            print(yourDate)
        
        dateLabel.text = "Alındığı tarih: \(string)"

//        let dateFormatterGet = DateFormatter()
//                dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//                let dateFormatterPrint = DateFormatter()
//                dateFormatterPrint.dateFormat = "MMM dd,yyyy"
//
//                let date: Date? = dateFormatterGet.date(from: "2018-02-01T19:10:04+00:00")
//                print("Date",dateFormatterPrint.string(from: date!)) // Feb 01,2018
//                return dateFormatterPrint.string(from: date!);
        
        
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
//
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy"
//
//        dateFormatterPrint.locale = Locale(identifier: "tr_TR")
//
//        if let date = dateFormatterGet.date(from: string) {
//            dateLabel.text = "Alındığı tarih: \(date)"
//        } else {
//           print("There was an error decoding the string")
//        }
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
//        dateFormatter.locale = Locale(identifier: "tr_TR")
//        let date = dateFormatter.date(from: string)
//
//
        
//
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US")
//        let date = Date(timeIntervalSinceReferenceDate: 118800)
//        print(dateFormatter.string(from: date))
        
    }
}
