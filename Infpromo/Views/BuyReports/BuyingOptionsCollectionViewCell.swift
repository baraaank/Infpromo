//
//  BuyingOptionsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.02.2022.
//

import UIKit

class BuyingOptionsCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "buyingOptionsCollectionViewCellIdentifier"
    
    private let numberOfReportsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: "2 Rapor", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private let actualPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: "80 TL", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor().infpromo, NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    private let reducedPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: "70 TL", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private let percentageOfEarning: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: "(%11 Kazanç)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        return label
    }()
    
    private let purchaseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().infpromo
         button.layer.cornerRadius = 4
         button.setTitle("Satın Al", for: .normal)
         return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(numberOfReportsLabel)
        addSubview(actualPriceLabel)
        addSubview(reducedPriceLabel)
        addSubview(percentageOfEarning)
        addSubview(purchaseButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        numberOfReportsLabel.frame = CGRect(x: 0, y: 10, width: width, height: 30)
        actualPriceLabel.frame = CGRect(x: 0, y: numberOfReportsLabel.bottom + 20, width: width, height: 20)
        reducedPriceLabel.frame = CGRect(x: 0, y: actualPriceLabel.bottom + 20, width: width, height: 30)
        percentageOfEarning.frame = CGRect(x: 0, y: height - 80, width: width, height: 20)
        purchaseButton.frame = CGRect(x: 20, y: height - 40, width: width - 40, height: 30)
    }
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
        layer.shadowRadius = 4.0

        // The color of the drop shadow
        layer.shadowColor = UIColor.lightGray.cgColor

        // How transparent the drop shadow is
        layer.shadowOpacity = 0.4

        // How far the shadow is offset from the UICollectionViewCell’s frame
        layer.shadowOffset = CGSize(width: 0, height: 3)
        
        
    }
    
    func configureCellContent(with: BuyingOptions) {
        numberOfReportsLabel.text = with.reportNumber
        actualPriceLabel.text = with.reportPriceBeforeDisc
        reducedPriceLabel.text = with.reportPrice
        percentageOfEarning.text = with.earningPercent
    }
}
