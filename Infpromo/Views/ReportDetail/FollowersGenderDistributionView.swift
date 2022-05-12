//
//  FollowersGenderDistributionView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import UIKit

class FollowersGenderDistributionView: UIView {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.attributedText = NSAttributedString(string: "Takipçi Cinsiyet Dağılımı", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black])
        label.textAlignment = .center
        return label
    }()
    
    private let womenView = ProgressBarWithInfos()
    private let manView = ProgressBarWithInfos()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .white
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfHeight = height / 12
        titleLabel.frame = CGRect(x: 10, y: oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        womenView.frame = CGRect(x: 10, y: titleLabel.bottom + oneOfHeight, width: width - 20, height: width / 9)
        manView.frame = CGRect(x: 10, y: womenView.bottom + oneOfHeight, width: width - 20, height: width / 9)
        
    }
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(womenView)
        addSubview(manView)
    }
    
    func configureWight(with viewModel: [GendersViewModel]) {
        
        let progressWomen = Float(viewModel.first?.weight ?? 0.0)
        let progressMan = Float(viewModel.last?.weight ?? 0.0)
        
        let progressWomenLabel = viewModel.first?.clearWeight ?? 0.0
        let progressManLabel = viewModel.last?.clearWeight ?? 0.0
        
        
        
        womenView.configureLabels(label: "Kadın:", progress: progressWomen, progressPercentageLabel: "\(progressWomenLabel)%", color: .systemPink)
        manView.configureLabels(label: "Erkek:", progress: progressMan, progressPercentageLabel: "\(progressManLabel)%", color: .blue)
        
        if progressManLabel == 0.0 {
            womenView.configureLabels(label: "Kadın:", progress: progressWomen, progressPercentageLabel: "NaN%", color: .clear)
            manView.configureLabels(label: "Erkek:", progress: progressMan, progressPercentageLabel: "NaN%", color: .clear)
        }
//        var genderLabel = viewModel.code
//        if viewModel.code == "FEMALE" {
//            genderLabel = "Kadın:"
//        } else {
//            genderLabel = "Erkek:"
//        }
//
//        let percentageLabel = "\(viewModel.clearWeight)%"
//
//        let floatWeight = Float(viewModel.weight)
//
//        womenView.configureLabels(label: genderLabel, progress: floatWeight, progressPercentageLabel: percentageLabel)
    }
}
