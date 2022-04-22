//
//  BuyingOptionsCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 18.02.2022.
//

import UIKit
import SkeletonView

class BuyingOptionsCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "buyingOptionsCollectionViewCellIdentifier"
    
    private let numberOfReportsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    private let actualPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    private let reducedPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    private let percentageOfEarning: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        return label
    }()
    
    private let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor().infpromo
        button.layer.cornerRadius = 4
        
        button.setAttributedTitle(NSAttributedString(string: "Satın Al", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.isHidden = true
        contentView.backgroundColor = .white
        addSubviews()
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(numberOfReportsLabel)
        contentView.addSubview(actualPriceLabel)
        contentView.addSubview(reducedPriceLabel)
        contentView.addSubview(percentageOfEarning)
        contentView.addSubview(purchaseButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let tenOfHeight = height / 12
        
        numberOfReportsLabel.frame = CGRect(x: 0, y: 10, width: width, height: tenOfHeight * 2)
        actualPriceLabel.frame = CGRect(x: 0, y: numberOfReportsLabel.bottom + tenOfHeight, width: width, height: tenOfHeight)
        reducedPriceLabel.frame = CGRect(x: 0, y: actualPriceLabel.bottom + tenOfHeight, width: width, height: tenOfHeight * 2)
        percentageOfEarning.frame = CGRect(x: 0, y: reducedPriceLabel.bottom + (tenOfHeight) / 2, width: width, height: tenOfHeight)
        purchaseButton.frame = CGRect(x: 20, y: height - tenOfHeight * 2.5, width: width - 40, height: tenOfHeight * 2)
    }
    
    func configureCell() {

        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
//        layer.shadowRadius = 4.0
//
//        // The color of the drop shadow
//        layer.shadowColor = UIColor.lightGray.cgColor
//
//        // How transparent the drop shadow is
//        layer.shadowOpacity = 0.4
//
//        // How far the shadow is offset from the UICollectionViewCell’s frame
//        layer.shadowOffset = CGSize(width: 0, height: 3)
//        
        
    }
    
    func configureCellContent(with: BuyingOptions) {
        numberOfReportsLabel.text = with.reportNumber
        actualPriceLabel.text = with.reportPriceBeforeDisc
        reducedPriceLabel.text = with.reportPrice
        percentageOfEarning.text = with.earningPercent
    }
    
    
    func configureCell(with viewModel: PlanCellViewModel) {
        numberOfReportsLabel.text = viewModel.name
        if let oldPrice = viewModel.oldPrice {
            actualPriceLabel.text = oldPrice
        }
        
        reducedPriceLabel.text = viewModel.newPrice
        if let profit = viewModel.profit {
            percentageOfEarning.text = "\(profit) kazanç"
        }
        
    }
}
