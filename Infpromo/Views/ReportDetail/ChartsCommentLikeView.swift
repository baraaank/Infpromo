//
//  ChartsCommentLikeView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.05.2022.
//

import UIKit
import Charts

class ChartsCommentLikeView: UIView {

    private let barChartView: BarChartView = {
       let chart = BarChartView()
        chart.backgroundColor = .green
        return chart
    }()
    
    let firstX = [0.8, 1.8, 2.8, 3.8, 4.8, 5.8, 6.8, 7.8]
    let secondX = [1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(barChartView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        barChartView.frame = bounds
    }
    
    func handleChart(likes: [Int], comments: [Int], created: [String]) {
        var barChartDatasFirst: [BarChartDataEntry] = []
        var barChartDatasSecond: [BarChartDataEntry] = []
        
        var doubleLikes: [Double] = []
        doubleLikes.append(contentsOf: likes.compactMap({Double($0)}))
        
        var doubleComments: [Double] = []
        doubleComments.append(contentsOf: comments.compactMap({Double($0)}))
        
        
        for x in 0..<8 {
            barChartDatasFirst.append(.init(x: firstX[x], y: doubleLikes[x]))
            barChartDatasSecond.append(.init(x: secondX[x], y: doubleComments[x]))
        }
        
        let formattedDate = dateOrganize(dateArray: created)
        
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: formattedDate)
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        let setBarChartDataEntriesFirst = BarChartDataSet(entries: barChartDatasFirst)
        let setBarChartDataEntriesSecond = BarChartDataSet(entries: barChartDatasSecond)
        
        barChartView.data = BarChartData(dataSets: [setBarChartDataEntriesFirst, setBarChartDataEntriesSecond])
        
        
        
    }
    
    func dateOrganize(dateArray: [String]) -> [String] {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMM yyyy"
        var dates: [String] = []
        for i in 0..<dateArray.count {
            if let date = dateFormatterGet.date(from: dateArray[i]) {
                dates.append(dateFormatterPrint.string(from: date))
            }
        }
        
        return dates
        
    }
    
    
    
    

}
