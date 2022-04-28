//
//  FollowersLocation.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import UIKit

class FollowersLocationView: UIView {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Takipçi Lokasyonları"
        return label
    }()
    
    private let firstCountry = ProgressBarWithInfos()
    private let secondCountry = ProgressBarWithInfos()
    private let thirdCountry = ProgressBarWithInfos()
    private let forthCountry = ProgressBarWithInfos()
    
    private let topCityLabel: UILabel = {
        let label = UILabel()
         label.textAlignment = .center
        label.text = "Top 5 Şehir"
         return label
    }()
    
    private let firstCityLabel: UILabel = {
      let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .left
        return label
    }()
    
    private let secondCityLabel: UILabel = {
      let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .left
        return label
    }()
    
    private let thirdCityLabel: UILabel = {
      let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .left
        return label
    }()
    
    private let forthCityLabel: UILabel = {
      let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .left
        return label
    }()
    
    private let fifthCityLabel: UILabel = {
      let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .systemGray2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let oneOfHeight = height / 30
        titleLabel.frame = CGRect(x: 10, y: oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        firstCountry.frame = CGRect(x: 10, y: titleLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        secondCountry.frame = CGRect(x: 10, y: firstCountry.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        thirdCountry.frame = CGRect(x: 10, y: secondCountry.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        forthCountry.frame = CGRect(x: 10, y: thirdCountry.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        topCityLabel.frame = CGRect(x: 10, y: forthCountry.bottom + oneOfHeight, width: width - 20, height: oneOfHeight * 2)
        firstCityLabel.frame = CGRect(x: 10, y: topCityLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight)
        secondCityLabel.frame = CGRect(x: 10, y: firstCityLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight)
        thirdCityLabel.frame = CGRect(x: 10, y: secondCityLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight)
        forthCityLabel.frame = CGRect(x: 10, y: thirdCityLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight)
        fifthCityLabel.frame = CGRect(x: 10, y: forthCityLabel.bottom + oneOfHeight, width: width - 20, height: oneOfHeight)
        
    }
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(firstCountry)
        addSubview(secondCountry)
        addSubview(thirdCountry)
        addSubview(forthCountry)
        addSubview(topCityLabel)
        addSubview(firstCityLabel)
        addSubview(secondCityLabel)
        addSubview(thirdCityLabel)
        addSubview(forthCityLabel)
        addSubview(fifthCityLabel)
    }
    
    
    func configureFollowersLocations(with viewModel: [FollowersLocationViewModel], city: [FollowersGeoCities]) {
        
        var codes: [String] = []
        codes.append(contentsOf: viewModel.map({ $0.code }))
        
        var progress: [Double] = []
        progress.append(contentsOf: viewModel.map({ $0.weight }))
        
        var percentageClear: [Double] = []
        percentageClear.append(contentsOf: viewModel.map({ $0.clearWeight}))
        
        if codes.count != 0 && progress.count != 0 {
            firstCountry.configureLabels(label: codes[0], progress: Float(progress[0]), progressPercentageLabel: "\(percentageClear[0])%")
            secondCountry.configureLabels(label: codes[1], progress: Float(progress[1]), progressPercentageLabel: "\(percentageClear[1])%")
            thirdCountry.configureLabels(label: codes[2], progress: Float(progress[2]), progressPercentageLabel: "\(percentageClear[2])%")
            forthCountry.configureLabels(label: codes[3], progress: Float(progress[3]), progressPercentageLabel: "\(percentageClear[3])%")
        }
        
        
        
        
        var cityCodes: [String] = []
        cityCodes.append(contentsOf: city.map({ $0.name }))
        
        if cityCodes.count != 0 {
            firstCityLabel.text = "1. \(cityCodes[0])"
            secondCityLabel.text = "2. \(cityCodes[1])"
            thirdCityLabel.text = "3. \(cityCodes[2])"
            forthCityLabel.text = "4. \(cityCodes[3])"
            fifthCityLabel.text = "5. \(cityCodes[4])"
        }
        
        
        
        
        
        
    }
}
