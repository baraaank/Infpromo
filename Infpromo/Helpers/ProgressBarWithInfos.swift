//
//  ProgressBarWithInfos.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import UIKit

class ProgressBarWithInfos: UIView {
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "-", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .left
        return label
    }()
    
    private let progressBar: UIProgressView = {
       let progressView = UIProgressView()
//        progressView.progress = 0.24
        progressView.progressTintColor = .red
        progressView.trackTintColor = .systemGray5
        
        return progressView
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "-", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(progressBar)
        addSubview(percentageLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: 0, width: width, height: height / 2)
        progressBar.frame = CGRect(x: 0, y: titleLabel.bottom + (height / 4), width: width - 60, height: height / 2)
        percentageLabel.frame = CGRect(x: progressBar.right + 10, y: titleLabel.bottom, width: 60, height: height / 2)
    }
    
    
    func configureLabels(label: String, progress: Float, progressPercentageLabel: String, color: UIColor) {
        titleLabel.text = label
        progressBar.progress = progress
        percentageLabel.text = progressPercentageLabel
        progressBar.progressTintColor = color
    }
    
    
}
