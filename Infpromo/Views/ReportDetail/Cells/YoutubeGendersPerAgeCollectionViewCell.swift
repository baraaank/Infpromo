//
//  YoutubeGendersPerAgeCollectionViewCell.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 11.05.2022.
//

import UIKit

class YoutubeGendersPerAgeCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "youtubeGendersPerAgeCollectionViewCellIdentifier"
    
    private let agesLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    
    private let menLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Erkek:", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.01
        return label
    }()
    
    private let womenLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Kadın:", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.01
        return label
    }()
    
    private let manPercentageLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.01
        label.textAlignment = .center
        return label
    }()
    
    private let womanPercentageLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "---", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        return label
    }()
    
    private let menPieChart: CAShapeLayer = {
       let circle = CAShapeLayer()
        
        return circle
    }()
    
    private let womenPieChart: CAShapeLayer = {
        let circle = CAShapeLayer()
         
         return circle
    }()
    
    private let manCircleLayer: CAShapeLayer = {
        let circle = CAShapeLayer()
         
         return circle
    }()
    
    private let womenCircleLayer: CAShapeLayer = {
        let circle = CAShapeLayer()
         
         return circle
    }()
    
    
    
    
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .white
        menCreateCircularPath(layer: manCircleLayer)
        womenCreateCircularPath(layer: womenCircleLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfHeight = height / 12
        let oneOfWidth = width / 12
        agesLabel.frame = CGRect(x: 10, y: (height / 2) - oneOfHeight, width: width / 4, height: oneOfHeight * 2)
        menLabel.frame = CGRect(x: agesLabel.right + (oneOfHeight / 2) - 10, y: (3.5 * oneOfWidth) - (oneOfHeight / 2) , width: oneOfHeight * 2 + 20, height: oneOfHeight)
        womenLabel.frame = CGRect(x: agesLabel.right + (oneOfHeight / 2) - 10, y:  height - (3.5 * oneOfWidth) - (oneOfHeight / 2), width: oneOfHeight * 2 + 20, height: oneOfHeight)
        manPercentageLabel.frame = CGRect(x: width - ( 3 * oneOfWidth) - (oneOfWidth) - 8, y: (3.5 * oneOfWidth) - (oneOfWidth / 2), width: oneOfWidth * 2 + 16, height: oneOfWidth)
        womanPercentageLabel.frame = CGRect(x: width - ( 3 * oneOfWidth) - (oneOfWidth) - 8, y: height - (3.5 * oneOfWidth) - (oneOfWidth / 2), width: oneOfWidth * 2 + 16, height: oneOfWidth)
    }
    
    func addSubviews() {
        contentView.addSubview(agesLabel)
        contentView.addSubview(menLabel)
        contentView.addSubview(womenLabel)
        contentView.addSubview(manPercentageLabel)
        contentView.addSubview(womanPercentageLabel)
        
    }
    
    func menCreateCircularPath(layer: CAShapeLayer) {
        
        let oneOfWidth = width / 12
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: width - ( 3 * oneOfWidth), y: 3.5 * oneOfWidth), radius: (oneOfWidth * 2), startAngle: startPoint, endAngle: endPoint, clockwise: true)
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.lineWidth = 4.0
        layer.strokeEnd = 1.0
        layer.strokeColor = UIColor.systemGray5.cgColor
        contentView.layer.addSublayer(layer)
        
        
    }
    
    func womenCreateCircularPath(layer: CAShapeLayer) {
        
        let oneOfWidth = width / 12
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: width - ( 3 * oneOfWidth), y: height - (3.5 * oneOfWidth)), radius: (oneOfWidth * 2), startAngle: startPoint, endAngle: endPoint, clockwise: true)
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.lineWidth = 4.0
        layer.strokeEnd = 1.0
        layer.strokeColor = UIColor.systemGray5.cgColor
        contentView.layer.addSublayer(layer)
        
        
    }
    
    func manCreateCaloriePath(strokeEnd: CGFloat, layer: CAShapeLayer) {
        
        let oneOfWidth = width / 12
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: width - ( 3 * oneOfWidth), y: 3.5 * oneOfWidth), radius: (oneOfWidth * 2), startAngle: startPoint, endAngle: endPoint, clockwise: true)
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.lineWidth = 4.0
        layer.strokeEnd = strokeEnd
        layer.strokeColor = UIColor.systemBlue.cgColor
        contentView.layer.addSublayer(layer)
    }
    
    
    func womanCreateCaloriePath(strokeEnd: CGFloat, layer: CAShapeLayer) {
        
        let oneOfWidth = width / 12
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: width - ( 3 * oneOfWidth), y: height - (3.5 * oneOfWidth)), radius: (oneOfWidth * 2), startAngle: startPoint, endAngle: endPoint, clockwise: true)
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.lineWidth = 4.0
        layer.strokeEnd = strokeEnd
        layer.strokeColor = UIColor.systemPink.cgColor
        
        contentView.layer.addSublayer(layer)
    }
    
    
    
    
    
    
    
    
    func configureCell(with viewModel: GendersPerAgeViewModel) {
        agesLabel.text = viewModel.code
//        let thousandMen = viewModel.male * 1000
//        let emptyMen = 100 - thousandMen
//
        manCreateCaloriePath(strokeEnd: viewModel.male, layer: menPieChart)
        womanCreateCaloriePath(strokeEnd: viewModel.female, layer: womenPieChart)
        
        manPercentageLabel.text = "\(viewModel.clearMale)%"
        womanPercentageLabel.text = "\(viewModel.clearFemale)%"
        
//        let thousandWomen = viewModel.female * 1000
//        let emptyWomen = 100 - thousandWomen
        
    }
}
